class sidecar::config (
  Array $backend_arr = $sidecar::backends,
  String $tagfile = $sidecar::tagfile,
  String $config_file = '/etc/graylog/collector-sidecar/collector_sidecar.yml',
  String $graylog_server = 'graylog.ics.dmz',
  Integer $graylog_port = 80
){

  concat { $config_file: ensure => 'present', }

  concat::fragment { 'Config':
    target => $config_file,
    content => epp('sidecar/collector_sidecar.epp', {
      graylog_server => $graylog_server,
      graylog_port => 80,
    }),
    order => 01,
  }

  concat::fragment { 'Tag start':
    target => $config_file,
    content => "tags:",
    order => 100,
  }

  concat::fragment { 'Tag start':
    target => $config_file,
    content => "  - $::kernel",
    order => 101,
  }

  Concat::Fragment <<| tag == 'sidecar_tags', order => 101, |>>

  concat::fragment { 'Backend start':
    target => $config_file,
    content => "backends:",
    order => 200,
  }


  # Backends will be added with order 201 
  $backend_arr.each |String $backend| {
    class {"sidecar::backends::${backend}":
      require => Concat::Fragment['Config'],
    }
  }



#  # Build file
#  if ! file($sidecar::tagfile) {
#    file { $sidecar::tagfile:
#      ensure => 'file',
#      content => $::kernel,
#    }
#  }
#  else {
#    $tagsfile = file($sidecar::tagfile),
#    $taglist = split($tagsfile, ',')
#  }
#
#  concat { $config_file: 
#    ensure => 'present',
#  }



}
