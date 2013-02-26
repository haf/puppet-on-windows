class chocolatey::exe {
  exec { 'bootstrap-chocolatey':
    command => 'powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString(\'http://chocolatey.org/install.ps1\'))"',
    creates => "${::systemdrive}/Chocolatey",
    notify  => Exec['update-path'],
    path    => 'C:/Windows/System32/WindowsPowerShell/v1.0'
  }
  exec { 'update-path':
    command     => "cmd /c SET PATH=${::path};${::systemdrive}\\chocolatey\\bin",
    refreshonly => true,
    path        => 'C:/Windows/System32'
  }
}