node default {
  notice("running as: $::username")
  class { 'gitconfig':
    root => 'D:/code/haf.puppettalk'
  }
}