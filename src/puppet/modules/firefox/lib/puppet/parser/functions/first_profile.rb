Puppet::Parser::Functions::newfunction(:first_profile, :type => :rvalue, :doc => 'Returns the first profile from the profiles folder') do
  p = args[0]
  File.join p, Dir.entries(p).reject{ |e| e == '.' || e == '..' }.first
end