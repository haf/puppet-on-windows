node default {
  $codelocation = "$::systemdrive/Users/$::username/provision"
  notice("running as: $::username")
  Exec { path => $::path }
  Package { provider => 'chocolatey' }
  
  class { 'profiles::dotfiles':
    codelocation => $codelocation
  }
  
  include chocolatey
  class { 'chocolatey::exe': }
  
  Package <| |> { require +> Class['chocolatey::exe'] }

  class { 'profiles::windowsbaseline':
    codelocation => $codelocation
  }
  class { 'profiles::rubydev': }
  class { 'profiles::dotnetdev': }
}