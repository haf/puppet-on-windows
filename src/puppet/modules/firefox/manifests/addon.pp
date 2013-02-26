define firefox::addon($source) {
  $ffpath = join($::appdata, 'Mozilla', 'Firefox', 'Profiles')
  $profile = first_profile($ffpath)
  $extensions = join($profile, 'extensions')
  $targetpath = join($extensions, basename($source))

  notify { "installing firefox ($ffpath) add-on: $name, to $extensions": }

  #file { $extensions:
  #  ensure => directory
  #}

  #httpfile { "$extensions/$name.xpi":
  #  ensure  => present,
  #  source  => $source,
  #  # hash => ... TODO - better hashing
  #  require => Package['firefox'] #[#]
  #}
}