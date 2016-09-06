class sidecar::apps::postgres{

  include sidecar

  @@concat::fragment {'postgres':
    target => $sidecar::config_file,
    content => "  - postgres\n",
    tag => 'sidecar_tags',
    order => '101'
  }

}
