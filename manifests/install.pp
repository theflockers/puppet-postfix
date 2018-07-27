class postfix::install inherits postfix {
  package { 'postfix':
    ensure => $::postfix::version,
  } 
}
