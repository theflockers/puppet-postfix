# Puppet postfix module
# 
class postfix (
  String $version = $postfix::params::version,
  Hash $cf = {}
) inherits postfix::params
{
  anchor { 'postfix::begin': }
  -> class { '::postfix::install': }
  -> class { '::postfix::config':  }
  -> class { '::postfix::service': }
  anchor { 'postfix::end': }
}
