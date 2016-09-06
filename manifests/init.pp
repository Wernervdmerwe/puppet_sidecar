class sidecar (
  String $tagfile = '/var/tmp/taglist',
  Array $backends = ['nxlog']
){

  package { ['collector-sidecar','nxlog-ce']:
    ensure => 'installed',
  }

  class {'sidecar::file':
    stage => first,
  }

  class {'sidecar::tags':
    require => Class['sidecar::file'],
  }

  include sidecar::config
  include sidecar::service

  Class['sidecar::file'] -> Class['sidecar::tags'] -> Class['sidecar::config']
}
