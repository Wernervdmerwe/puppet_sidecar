class sidecar::tags (
  String $tagfile = $sidecar::tagfile
){

  concat { $tagfile: ensure => 'present', }

  concat::fragment { 'kernel':
    target  => $tagfile,
    content => "$::kernel",
    order   => '01',
    tag => 'sidecar_tags',
  }

  Concat::Fragment <<| tag == 'sidecar_tags' |>>

}
