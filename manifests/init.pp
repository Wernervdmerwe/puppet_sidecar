class sidecar (
  String $tagfile = '/var/tmp/taglist',
  Array $backends = ['nxlog']
){

  package { ['collector-sidecar','nxlog-ce']:
    ensure => 'installed',
  }

  file {$tagfile:
    ensure => 'file',
    content => "$::kernel",
    onlyif => "test ! -f $tagfile"
  }

  include sidecar::tags
  include sidecar::config
  include sidecar::service

  Class['sidecar::tags'] -> Class['sidecar::config']
}
