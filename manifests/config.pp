#
class postfix::config inherits postfix {
  class { 'postfix::cf': 
     main   => $cf['main'],
     master => $cf['master']
  }
}
