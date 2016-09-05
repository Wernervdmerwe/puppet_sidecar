class sidecar::service(
  String $tagfile = $sidecar::tagfile
){

  exec { 'Register service':
    path => $path,
    command => 'graylog-collector-sidecar -service install',
    creates => '/etc/systemd/system/collector-sidecar.service',
  }

  service {'collector-sidecar':
    ensure => 'running',
    enable => true,
    provider => 'systemd',
    subscribe => File['/etc/graylog/collector-sidecar/collector_sidecar.yml'],
  }

}
