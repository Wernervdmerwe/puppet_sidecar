class sidecar (
  String $tagfile = '/var/tmp/taglist',
  String $config_file = '/etc/graylog/collector-sidecar/collector_sidecar.yml',
  Array $backends = ['nxlog']
){

  package { ['collector-sidecar','nxlog-ce']: ensure => 'installed',  }

  include sidecar::config
  include sidecar::service

}
