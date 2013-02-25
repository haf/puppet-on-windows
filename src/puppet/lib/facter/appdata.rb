require 'facter'

Facter.add('appdata') do
  confine :operatingsystem => %w{windows}
  setcode do
    ENV['APPDATA']
  end
end