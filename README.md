# Bootstrap Windows Dev Machine

1. Install Windows 7 + [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install VBoxAdditions
3. Share folder, E:, permanent D:\code\haf.puppettalk, no automount
4. In PS (**As Administrator**):

  net use E: \\vboxsrv\provision
  cd ~
  robocopy /MIR E:/ ./provision
  cd provision/src/puppet
  Set-ExecutionPolicy RemoteSigned -Force
  (new-object net.webclient).DownloadFile('https://downloads.puppetlabs.com/windows/puppet-3.1.0.msi', './puppet.msi')
  cmd /c start /wait msiexec /passive /i puppet.msi
  cmd /E:ON /K "C:\Program Files (x86)\Puppet Labs\Puppet\bin\puppet_shell.bat"
  puppet apply manifests/initial.pp --debug --verbose --trace --modulepath modules --libdir lib
  
--> RESTART CONSOLES (1 admin, 1 normal)

--> NOW WE HAVE CHOCOLATEY:
  cinst spotify
  start "spotify:track:0DFzlCIaDlkEZDQmvMLjzs"

--> AS ADMIN: PERFORM REAL PROVISION
  cd ~/provision/src/puppet
  cmd /E:ON /K "C:\Program Files (x86)\Puppet Labs\Puppet\bin\puppet_shell.bat"
  puppet apply manifests/site.pp --debug --verbose --trace --modulepath modules --libdir lib
  

Backups:
net use \\vboxsrv\provision /delete
while ($true) {  robocopy /MIR E:/ ./provision ; sleep 2 }

cinst spotify
start "spotify:track:0DFzlCIaDlkEZDQmvMLjzs"
start "spotify:track:7DsVg32W5J9inhuN3UJvId"