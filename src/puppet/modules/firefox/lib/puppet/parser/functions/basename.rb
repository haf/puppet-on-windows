Puppet::Parser::Functions::newfunction(:basename, 
  :type => :rvalue, 
  :doc => 'Gets the filename of the passed path') do |args|
  File.basename(args[0])
end