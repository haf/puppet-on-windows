require 'facter'

Facter.add('systemdrive') do
  confine :operatingsystem => %w{windows}
  setcode do
    ENV['SYSTEMDRIVE']
  end
end