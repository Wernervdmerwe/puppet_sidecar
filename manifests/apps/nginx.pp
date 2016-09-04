class sidecar::apps::nginx {

  include sidecar

  @@concat::fragment {'nginx':
    target => $sidecar::tagfile,
    content => ',nginx',
    tag => 'sidecar_tags',
    order => 10
  }

}
