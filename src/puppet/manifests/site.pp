node default {
  $codelocation = 'D:/code/haf.puppettalk'

  notice("running as: $::username")

  Exec {
    path => $::path
  }

  # chocolatey version all -lo
  include chocolatey::exe
  Package { provider => 'chocolatey' }

  class { 'profiles::dotfiles':
    codelocation => $codelocation
  }

  # all packages depend on havin the executable on disk
  Package <| |> { require +> Class['chocolatey::exe'] }


  class { 'profiles::windowsbaseline': }
  # class { 'profiles::dotnetdev': }
  class { 'profiles::rubydev': }
  # - AdBlock plus
  # - WebDeveloper toolbar
  # - Firebug
  # TODO: Visual Studio
}