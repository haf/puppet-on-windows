# puppet-httpfile

Usage:

```puppet
httpfile { '/tmp/myfile.deb':
  ensure => present,
  source => 'https://cloud.github.com/whatever.deb',
  hash   => 'hex form SHA2 hash OR an URL to the .sha file with that hash'
}
```


## Future features thought of:

 * Hash provider rather than hard-coded SHA2
 * E-tag support
 * Better STAT-support to avoid hashing the file over and over.
