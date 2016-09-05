class sidecar::service(
  String $tagfile = $sidecar::tagfile
){

  service {'collector-sidecar':
    ensure => 'running',
    enable => true,
    provider => 'systemd',
    subscribe => File['/etc/graylog/collector-sidecar/collector_sidecar.yml'],
  }

}
