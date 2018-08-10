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

# service type  private unpriv  chroot  wakeup  maxproc command + args
  $default_transports = {
    'smtp' => {
      'type'    => 'inet',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => '-',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'smtpd',
      'args'    => ''
    },
    'pickup' => {
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => '-',
      'wakeup'  => '60',
      'maxproc' => '1',
      'command' => 'pipe',
      'args'    => ''
    }
  }
}
