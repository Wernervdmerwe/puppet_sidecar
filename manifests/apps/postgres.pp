class sidecar::apps::postgres{

  include sidecar

  @@concat::fragment {'postgres':
    target => $sidecar::config_file,
    content => '  - postgres',
    tag => 'sidecar_tags',
    order => 101
  }

}
