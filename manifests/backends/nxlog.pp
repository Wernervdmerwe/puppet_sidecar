class sidecar::backends::nxlog (
  String $config_file = '/etc/graylog/collector-sidecar/collector_sidecar.yml'
){

  concat::fragment { 'NXLog Backend':
    target => $config_file,
    content => epp('sidecar/backends.epp', {
      name => 'nxlog',
      enabled => true,
      binary => '/usr/bin/nxlog',
      config => '/etc/graylog/collector-sidecar/generated/nxlog.conf'
    }),
    order => 21,
  }

}
