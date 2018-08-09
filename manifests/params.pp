# postfix/functions/params.pp
class postfix::params {
  $version  = 'latest'
  $defaults = {
    'mailbox_size_limit'  => 0,
    'recipient_delimiter' => '+',
    'inet_interfaces'     => 'all',
    'inet_protocols'      => 'ipv4',
    'alias_maps'          => 'hash:/etc/aliases' # to avoid NIS warning in the log
  }
}
