class sidecar (
  String $tagfile = '/var/tmp/taglist',
  Array $backends = ['nxlog']
){

  package { 'collector-sidecar':
    ensure => 'installed',
  }

  include sidecar::tags
  include sidecar::config
  include sidecar::service

  Class['sidecar::tags'] -> Class['sidecar::config']
}
