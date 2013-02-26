module Puppet
  Puppet::Type.type(:file).newproperty(:target) do
    desc "The target for creating a link.  Currently, symlinks are the
      only type supported. This attribute is mutually exclusive with `source`
      and `content`.

      Symlink targets can be relative, as well as absolute:

          # (Useful on Solaris)
          file { \"/etc/inetd.conf\":
            ensure => link,
            target => \"inet/inetd.conf\",
          }

      Directories of symlinks can be served recursively by instead using the
      `source` attribute, setting `ensure` to `directory`, and setting the
      `links` attribute to `manage`."

    newvalue(:notlink) do
      # We do nothing if the value is absent
      return :nochange
    end

    # Anything else, basically
    newvalue(/./) do
      @resource[:ensure] = :link if ! @resource.should(:ensure)

      # Only call mklink if ensure didn't call us in the first place.
      currentensure  = @resource.property(:ensure).retrieve
      mklink if @resource.property(:ensure).safe_insync?(currentensure)
    end

    # Create our link.
    def mklink
      target = self.should

      # Clean up any existing objects.  The argument is just for logging,
      # it doesn't determine what's removed.
      @resource.remove_existing(target)

      raise Puppet::Error, "Could not remove existing file" if FileTest.exists?(@resource[:path])

      Dir.chdir(File.dirname(@resource[:path])) do
        Puppet::Util::SUIDManager.asuser(@resource.asuser) do
          mode = @resource.should(:mode)
          if mode
            Puppet::Util.withumask(000) do
              symlink @resource[:path], target
            end
          else
            symlink @resource[:path], target
          end
        end

        @resource.send(:property_fix)

        :link_created
      end
    end

    def symlink src, targ
      unless Puppet.features.microsoft_windows?
        File.symlink(targ, src)
      else
        # on Windows, it's the other way around. Confusion abounds.
        system %Q[cmd /c mklink "#{src}" "#{targ}"]
      end
    end

    def insync?(currentvalue)
      if [:nochange, :notlink].include?(self.should) or @resource.recurse?
        return true
      elsif ! @resource.replace? and File.exists?(@resource[:path])
        return true
      else
        return super(currentvalue)
      end
    end


    def retrieve
      if stat = @resource.stat
        if stat.ftype == "link"
          return File.readlink(@resource[:path])
        else
          return :notlink
        end
      else
        return :absent
      end
    end
  end
end

