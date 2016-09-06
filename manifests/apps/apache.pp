class sidecar::apps::apache{

  include sidecar

  @@concat::fragment {'apache':
    target => $sidecar::config_file,
    content => '  - apache',
    tag => 'sidecar_tags',
    order => 101
  }

}
