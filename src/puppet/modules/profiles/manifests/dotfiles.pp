class profiles::dotfiles($codelocation) {
  class { 'gitconfig':
    root => $codelocation
  }

  class { 'id_rsa_pub':
    root => $codelocation
  }

  class { 'bashprofile':
    root => $codelocation
  }
}