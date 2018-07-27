class postfix::service {
  service { 'postfix':
    ensure => 'running'
  }
}
