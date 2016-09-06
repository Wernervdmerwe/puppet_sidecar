class sidecar (
  String $tagfile = '/var/tmp/taglist',
  Array $backends = ['nxlog']
){

  package { ['collector-sidecar','nxlog-ce']: ensure => 'installed',  }

  include sidecar::config
  include sidecar::service

}
