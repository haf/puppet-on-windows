class profiles::windowsbaseline {
  package { [
    '7zip.commandline',
    'git.install',
    'firefox',
    '1password'
    ]:
    ensure => installed,
  }
}