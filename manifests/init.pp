class sidecar (
  String $tagfile = '/var/tmp/taglist',
  Array $backends = ['nxlog']
){

  package { ['collector-sidecar','nxlog-ce']:
    ensure => 'installed',
  }

  exec {'Create File If Not Exist':
    path => $path,
    command => "echo $::kernel > $tagfile",
    creates => $tagfile,
  }

  include sidecar::tags
  include sidecar::config
  include sidecar::service

  Class['sidecar::tags'] -> Class['sidecar::config']
}
