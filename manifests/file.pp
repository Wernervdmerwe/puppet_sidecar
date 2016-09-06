class sidecar::file (
  String $tagfile = '/var/tmp/taglist'
){

  exec {'Create File If Not Exist':
    path => $path,
    command => "echo $::kernel > $tagfile",
    creates => $tagfile,
  }

   stage => first,
}
