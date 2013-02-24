class bashrc(
  $root = undef
) {
  $targ = "C:/Users/${::username}"

  file { "$targ/.bashrc":
    ensure  => link,
    target  => "$root/src/dotfiles/.bashrc"
  }
}

class id_rsa_pub(
  $root = undef
) {

  $targ = "C:/Users/${::username}"

  file { "$targ/.ssh/id_rsa.pub":
    ensure  => link,
    target  => "$root/src/dotfiles/id_rsa.pub",
    require => File["$targ/.ssh"],
  }
}