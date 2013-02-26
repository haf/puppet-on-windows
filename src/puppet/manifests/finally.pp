node default {
  $codelocation = "$::systemdrive/Users/$::username/provision"
  notice("running as: $::username")
  Exec { path => $::path }
  Package { provider => 'chocolatey' }
  
  package { 'VisualStudio2012Ultimate':
    ensure => installed
  }
}