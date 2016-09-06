class sidecar::apps::nginx {

  include sidecar

  @@concat::fragment {'nginx':
    target => $sidecar::config_file,
    content => "  - nginx\n",
    tag => 'sidecar_tags',
    order => 101
  }

}
