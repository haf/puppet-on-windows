# enable support for puppet symlinks on Windows
class psym {
  file { "$::systemdrive/Program Files (x86)/Puppet Labs/Puppet/puppet/lib/puppet/type/file/target.rb":
    ensure => present,
    source => 'puppet:///modules/psym/target.rb'
  }
}