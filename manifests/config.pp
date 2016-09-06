class sidecar::config (
  Array $backend_arr = $sidecar::backends,
  String $config_file = $sidecar::config_file,
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
    order => '001',
  }

  concat::fragment { 'Tag start':
    target => $config_file,
    content => "tags: \n",
    order => '100',
  }

  concat::fragment { 'Kernel Tag start':
    target => $config_file,
    content => "  - $::kernel \n",
    order => '101',
  }

  Concat::Fragment <<| tag == 'sidecar_tags' |>>

  concat::fragment { 'Backend start':
    target => $config_file,
    content => "backends: \n",
    order => '200',
  }


  # Backends will be added with order 201 
  $backend_arr.each |String $backend| {
    class {"sidecar::backends::${backend}":
      require => Concat::Fragment['Config'],
    }
  }
}
