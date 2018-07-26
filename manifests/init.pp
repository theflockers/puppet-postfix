#
class postfix (
  String $version,
  Hash   $conf,
) inherits postfix::params 
{
  include stdlib

  # get all default parameters
  $defaults = $postfix::params::defaults

  package { "postfix":
    ensure => $version,
  }

  # merge all configs in one
  $config = deep_merge($conf, $defaults)

  file { '/etc/postfix/main.cf':
    ensure  => file,
    content => template('postfix/main.cf.dynamic.erb'),
    notify  => Service['postfix']
  }

  service { "postfix":
    ensure => "running"
  }
}
