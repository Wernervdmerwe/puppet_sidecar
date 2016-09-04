class sidecar (
  String $tagfile = '/var/tmp/taglist',
  Array $backends = ['nxlog']
){

  package { 'collector-sidecar':
    ensure => 'installed',
  }

  include sidecar::tags
  include sidecar::config

  Class['sidecar::tags'] -> Class['sidecar::config']
}
