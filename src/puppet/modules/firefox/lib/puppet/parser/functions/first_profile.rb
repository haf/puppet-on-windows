Puppet::Parser::Functions::newfunction(:first_profile, 
  :type => :rvalue, 
  :doc => 'Returns the first profile from the profiles folder') do |args|
  p = args[0]
  return 'missing.default' unless File.exists? p
  File.join p, Dir.entries(p).reject{ |e| e == '.' || e == '..' }.first
end