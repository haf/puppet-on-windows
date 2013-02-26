node default {
  stage { 'first':
    before => Stage['main'],
  }
  class { 'psym':
    stage => first
  }
  class { 'chocolatey::exe': }
}