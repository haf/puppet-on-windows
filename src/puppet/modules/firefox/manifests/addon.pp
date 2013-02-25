define firefox::addon($source) {
  $ffpath = join($::appdata, 'Mozilla', 'Firefox', 'Profiles')
  $profile = first_profile($ffpath)
  $extensions = join($profile, 'extensions')
  $targetpath = join($extensions, basename($source))

  notify { "installing firefox add-on: $name, to $targetpath": }
  
  httpfile { $targetpath:
    ensure => present,
    source => $source
  }
}