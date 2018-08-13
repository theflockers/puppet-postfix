# Puppet postfix module
# 
class postfix (
  String $version = $postfix::params::version,
  Hash $cf = {}
) inherits postfix::params
{
  $tmpdir = '/tmp/postfix-cf'
  tempdir($tmpdir)
  anchor { 'postfix::begin': }
  class { '::postfix::install': }
  -> class { '::postfix::config':  
    tempdir => $tempdir,
  }
 -> class { '::postfix::service': }
  anchor { 'postfix::end': }
}
