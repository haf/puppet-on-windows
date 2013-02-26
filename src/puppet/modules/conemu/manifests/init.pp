class conemu(
  $codelocation
) {
  package { "$codelocation/src/packages/ConEmu.13.2.23.nupkg":
    ensure => installed,
    provider => 'chocolatey'
  }
}