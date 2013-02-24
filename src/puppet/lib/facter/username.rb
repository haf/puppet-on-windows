require 'facter'
Facter.add('username') do
  confine :operatingsystem => %w{windows}
  setcode do
    `whoami`.chomp.split(/\\/)[1]
  end
end