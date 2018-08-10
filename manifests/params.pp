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
  $default_transports = [
    {
      'name'    => 'smtp',
      'type'    => 'inet',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => '-',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'smtpd',
      'args'    => ''
    },
    {
      'name'    => 'pickup',
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => '-',
      'wakeup'  => '60',
      'maxproc' => '1',
      'command' => 'pickup',
      'args'    => ''
    },
    {
      'name'    => 'cleanup',
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '0',
      'command' => 'cleanup',
      'args'    => ''
    },
    {
      'name'    => 'qmgr',
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'n',
      'wakeup'  => '300',
      'maxproc' => '1',
      'command' => 'qmgr',
      'args'    => ''
    },
    {
      'name'    => 'tlsmgr',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '1000?',
      'maxproc' => '1',
      'command' => 'tlsmgr',
      'args'    => ''
    },
    {
      'name'    => 'trivial',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'trivial-rewrite',
      'args'    => ''
    },
    {
      'name'    => 'bounce',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '0',
      'command' => 'bounce',
      'args'    => ''
    },
    {
      'name'    => 'defer',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'bounce',
      'args'    => ''
    },
    {
      'name'    => 'trace',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'bounce',
      'args'    => ''
    },
    {
      'name'    => 'verify',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'verify',
      'args'    => ''
    },
    {
      'name'    => 'flush',
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '1000?',
      'maxproc' => '0',
      'command' => 'flush',
      'args'    => ''
    },
    {
      'name'    => 'proxymap',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'proxymap',
      'args'    => ''
    },
    {
      'name'    => 'proxywrite',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'proxymap',
      'args'    => ''
    },
    {
      'name'    => 'smtp',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'smtp',
      'args'    => ''
    },
    {
      'name'    => 'relay',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'smtp',
      'args'    => ''
    },
    {
      'name'    => 'showq',
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'showq',
      'args'    => ''
    },
    {
      'name'    => 'error',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'error',
      'args'    => ''
    },
    {
      'name'    => 'retry',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'error',
      'args'    => ''
    },
    {
      'name'    => 'discard',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'discard',
      'args'    => ''
    },
    {
      'name'    => 'local',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'local',
      'args'    => ''
    },
    {
      'name'    => 'virtual'
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'virtual',
      'args'    => ''
    },
    {
      'name'    => 'lmtp',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'lmtp',
      'args'    => ''
    },
    {
      'name'    => 'anvil',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'anvil',
      'args'    => ''
    },
    {
      'name'    => 'scache',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'scache',
      'args'    => ''
    },
    {
      'name'    => 'maildrop',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'pipe',
      'args'    => '  flags=DRhu user=vmail argv=/usr/bin/maildrop -d ${recipient}'
    },
    {
      'name'    => 'uucp',
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'pipe',
      'args'    => '  flags=Fqhu user=uucp argv=uux -r -n -z -a$sender - $nexthop!rmail ($recipient)'
    },
  ]
}
