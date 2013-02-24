class chocolatey::exe {
  exec { 'bootstrap-chocolatey':
    command => '@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString(\'http://chocolatey.org/install.ps1\'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin',
    creates => "${::systemdrive}/Chocolatey"
  }
}