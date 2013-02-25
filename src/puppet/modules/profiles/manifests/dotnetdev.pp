class profiles::dotnetdev {
  package { 'VisualStudio2012Ultimate':
    ensure => installed
  }
}