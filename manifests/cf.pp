# 
class postfix::cf ( 
  Hash $main   = {}, 
  Array $master = []
) {

  # create the temporary postfix directory
  $tempdir = Postfix::Util::Tempdir.new("postfix-cf-dir")

  # merge default parameters with the given parameters
  $config = deep_merge($main, $postfix::params::defaults)
  file { "${tempdir}/main.cf":
    ensure  => file,
    content => template('postfix/main.cf.dynamic.erb'),
    notify  => Service['postfix']
  }

  $transports = union($master, $postfix::params::default_transports)
  file { '${tempdir}/master.cf':
    ensure  => file,
    content => template('postfix/master.cf.erb'),
    notify  => Service['postfix']
  }

}
