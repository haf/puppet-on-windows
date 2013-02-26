class bashprofile(
  $root = undef
) {
  $targ = "$::systemdrive/Users/${::username}"

  file { "$targ/.bash_profile":
    ensure  => link,
    target  => "$root/src/dotfiles/.bash_profile"
  }
}