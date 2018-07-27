#
class postfix::config inherits postfix {

  # merge default parameters with the given parameters
  $config = deep_merge($postfix::maincf, $postfix::params::defaults)

  notice($config)
  # render
  file { '/etc/postfix/main.cf':
    ensure  => file,
    content => template('postfix/main.cf.dynamic.erb'),
    notify  => Service['postfix']
  }
}
