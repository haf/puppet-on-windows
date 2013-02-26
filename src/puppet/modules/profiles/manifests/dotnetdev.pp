class profiles::dotnetdev {
  package { 'NugetPackageExplorer':
    ensure => installed
  }
  package { 'rabbitmq':
    ensure => installed
  }
}