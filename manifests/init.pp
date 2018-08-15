# Puppet postfix module
# 
class postfix (
  String $version = $postfix::params::version,
  Hash $cf = {}
) inherits postfix::params
{
  $dirname = tempdir('postfix-cf')
  anchor { 'postfix::begin': }
  class { '::postfix::install': }
  -> class { '::postfix::config':
    tempdir => $dirname,
  }
 -> class { '::postfix::service': }
  anchor { 'postfix::end': }
}
