class sidecar::config (
  $tagsfile = file($sidecar::tagfile),
  Array $backend_arr = $sidecar::backends,
  String $config_file = '/etc/graylog/collector-sidecar/collector_sidecar.yml',
  String $graylog_server = 'mon01.ics.dmz',
  Integer $graylog_port = 80
){

  $taglist = split($tagsfile, ',')

  concat { $config_file: ensure => 'present' }

  concat::fragment { 'Config':
    target           => $config_file,
    order            => 01,
    content          => epp('sidecar/collector_sidecar.epp',
    {
      graylog_server => $graylog_server,
      graylog_port   => 80,
      tags           => $taglist
    }),
  }

  # Backends will be added with order 21 
  $backend_arr.each |String $backend| {
    include "sidecar::backends::${backend}"
  }


}
