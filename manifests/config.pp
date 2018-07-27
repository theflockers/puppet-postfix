#
class postfix::config inherits postfix {

  # merge default parameters with the given parameters
  $config = deep_merge($maincf, $postfix::params::defaults)

  # render
  file { '/etc/postfix/main.cf':
    ensure  => file,
    content => template('postfix/main.cf.dynamic.erb'),
    notify  => Service['postfix']
  }
}
