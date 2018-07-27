#
class postfix (
  String $version = $postfix::params::version,
  Hash   $maincf  = {},
) inherits postfix::params 
{
  create_resources('::postfix::conf', $maincf)
  anchor { 'postfix::begin': }
  -> class { '::postfix::install': }
  -> class { '::postfix::config':  }
  -> class { '::postfix::service': }
  anchor { 'postfix::end': }
}
