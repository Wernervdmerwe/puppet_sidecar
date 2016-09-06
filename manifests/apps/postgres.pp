class sidecar::apps::postgres{

  include sidecar

  @@concat::fragment {'postgres':
    target => $sidecar::tagfile,
    content => '  - postgres',
    tag => 'sidecar_tags',
    order => 101
  }

}
