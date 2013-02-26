class profiles::dotnetdev {
  package { 'VisualStudio2012Ultimate':
    ensure => installed
  }
  package { 'rabbitmq':
    ensure => installed
  }
}