class sidecar::apps::nginx {

  include sidecar

  @@concat::fragment {'nginx':
    target => $sidecar::config_file,
    content => '  - nginx',
    tag => 'sidecar_tags',
    order => 101
  }

}
