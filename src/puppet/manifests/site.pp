node default {
  $code_location = 'D:/code/haf.puppettalk'
  
  notice("running as: $::username")

  Exec {
    path => $::path
  }

  class { 'gitconfig':
    root => $code_location
  }

  class { 'id_rsa_pub':
    root => $code_location
  }
  
  class { 'bashrc':
    root => $code_location
  }

  # my packages:
  # chocolatey version all -lo
  include chocolatey::exe

  Package {
    provider => 'chocolatey'
  }
  
  Package <| |> { require +> Class['chocolatey::exe'] }
  
  package { '7zip.commandline':
    ensure   => latest,
  }

  package { 'git.install':
    ensure => installed,
  }

  # TODO: Visual Studio
}