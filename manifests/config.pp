#
class postfix::config (
  String $tempdir,
) inherits postfix {
  class { 'postfix::cf': 
     main    => $cf['main'],
     master  => $cf['master'],
     tempdir => $tempdir,
  }
}
