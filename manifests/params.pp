# postfix/functions/params.pp
class postfix::params {
  $version  = 'latest'
  $defaults = {
    'mailbox_size_limit'  => 0,
    'recipient_delimiter' => '+',
    'inet_interfaces'     => 'all',
    'inet_protocols'      => 'ipv4'
  }
}
