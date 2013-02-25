class profiles::rubydev {
  package { ['ruby.devkit']:
    ensure => installed
  }
}