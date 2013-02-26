# Steps Taken

1. Install Windows 7
2. Install VBoxAdditions
3. Share folder, E:
4. In PS (**As Administrator**):
  net use E: \\vboxsrv\provision /delete
  net use E: \\vboxsrv\provision
  robocopy /MIR E:/ ./provision
  cd provision/src/puppet
  Set-ExecutionPolicy RemoteSigned
  (new-object net.webclient).DownloadFile('https://downloads.puppetlabs.com/windows/puppet-3.1.0.msi', './puppet.msi')
  cmd /c start /wait msiexec /passive /i puppet.msi
  cmd /E:ON /K "C:\Program Files (x86)\Puppet Labs\Puppet\bin\puppet_shell.bat"
  puppet apply manifests/initial.pp --debug --verbose --trace --modulepath modules --libdir lib
--> RESTART CONSOLE
  puppet apply manifests/site.pp --debug --verbose --trace --modulepath modules --libdir lib
  
  
Backups:
while ($true) {  robocopy /MIR E:/ ./provision ; sleep 2 }