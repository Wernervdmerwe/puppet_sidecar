class sidecar::apps::apache{

  include sidecar

  @@concat::fragment {'apache':
    target => $sidecar::tagfile,
    content => ',apache',
    tag => 'sidecar_tags',
    order => 10
  }

}
