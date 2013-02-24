node default {
  $code_location = 'D:/code/haf.puppettalk'
  
  notice("running as: $::username")
  class { 'gitconfig':
    root => $code_location
  }
  class { 'id_rsa_pub':
    root => $code_location
  }
}