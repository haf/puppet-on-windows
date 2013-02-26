Puppet::Parser::Functions::newfunction(:join, 
  :type => :rvalue, 
  :doc => 'joins all arguments with File.join') do |args|
  File.join(*args).gsub(/\\/, '/')
end