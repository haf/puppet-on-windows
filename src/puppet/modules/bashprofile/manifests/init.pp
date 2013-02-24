class bashprofile(
  $root = undef
) {
  $targ = "C:/Users/${::username}"

  file { "$targ/.bash_profile":
    ensure  => link,
    target  => "$root/src/dotfiles/.bash_profile"
  }
}