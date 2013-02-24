class gitconfig(
  $root = undef
) {
  file { "C:/Users/${::username}/.gitconfig":
    ensure => link,
    target => "$root/src/dotfiles/.gitconfig"
  }
}