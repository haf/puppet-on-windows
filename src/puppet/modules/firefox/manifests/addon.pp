define firefox::addon($source) {
  $ffpath = join($::appdata, 'Mozilla', 'Firefox', 'Profiles')
  $profile = first_profile($ffpath)
  $extensions = join($profile, 'extensions')
  $targetpath = join($extensions, basename($source))

  notify { "installing firefox ($ffpath) add-on: $name, to $extensions": }
  
  #httpfile { "$extensions/$name.xpi":
  #  ensure  => present,
  #  source  => $source,
  #  require => Package['firefox']
  #}
}