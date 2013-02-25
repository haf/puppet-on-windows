class profiles::windowsbaseline {
  package { [
    '7zip.commandline',
    'git.install',
    'firefox',
    '1password'
    ]:
    ensure => installed,
  }

  Firefox::Addon <| |> { require +> Package['firefox'] }

  include firefox
  
  firefox::addon { 'firebug':
    source => "https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi?src=search",
  }
  firefox::addon { 'webdev-toolbar':
    source => "https://addons.mozilla.org/firefox/downloads/latest/60/addon-60-latest.xpi?src=search",
  }
  firefox::addon { 'adblock-plus':
    source => "https://addons.mozilla.org/firefox/downloads/latest/adblock-plus/addon-adblock-plus-latest.xpi",
  }
}