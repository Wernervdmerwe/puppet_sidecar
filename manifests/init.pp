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

  include sidecar::tags
  include sidecar::config
  include sidecar::service

  Class['sidecar::file'] -> Class['sidecar::tags'] -> Class['sidecar::config']
}
