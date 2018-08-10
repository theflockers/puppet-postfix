# 
class postfix::cf ( 
  Hash $main = {}, 
  Hash $master = {}
) {
  # merge default parameters with the given parameters
  $config = deep_merge($main, $postfix::params::defaults)
  file { '/etc/postfix/main.cf':
    ensure  => file,
    content => template('postfix/main.cf.dynamic.erb'),
    notify  => Service['postfix']
  }

  $transports = deep_merge($master, $postfix::params::default_transports)
  file { '/etc/postfix/master.cf':
    ensure  => file,
    content => template('postfix/master.cf.dynamic.erb'),
    notify  => Service['postfix']
  }

}
