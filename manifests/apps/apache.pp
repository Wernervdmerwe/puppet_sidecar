class sidecar::apps::apache{

  include sidecar

  @@concat::fragment {'apache':
    target => $sidecar::config_file,
    content => "  - apache\n",
    tag => 'sidecar_tags',
    order => '101'
  }

}
