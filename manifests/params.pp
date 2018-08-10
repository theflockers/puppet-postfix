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
      'command' => 'pickup',
      'args'    => ''
    },
    'cleanup' => {
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '0',
      'command' => 'cleanup',
      'args'    => ''
    },
    'qmgr' => {
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'n',
      'wakeup'  => '300',
      'maxproc' => '1',
      'command' => 'qmgr',
      'args'    => ''
    },
    'tlsmgr' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '1000?',
      'maxproc' => '1',
      'command' => 'tlsmgr',
      'args'    => ''
    },
    'rewrite' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'trivial-rewrite',
      'args'    => ''
    },
    'bounce' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '0',
      'command' => 'bounce',
      'args'    => ''
    },
    'defer' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'bounce',
      'args'    => ''
    },
    'trace' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'bounce',
      'args'    => ''
    },
    'verify' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'verify',
      'args'    => ''
    },
    'flush' => {
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '1000?',
      'maxproc' => '0',
      'command' => 'flush',
      'args'    => ''
    },
    'proxymap' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'proxymap',
      'args'    => ''
    },
    'proxywrite' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'proxymap',
      'args'    => ''
    },
    'smtp' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'smtp',
      'args'    => ''
    },
    'relay' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'smtp',
      'args'    => ''
    },
    'showq' => {
      'type'    => 'unix',
      'private' => 'n',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'showq',
      'args'    => ''
    },
    'error' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'error',
      'args'    => ''
    },
    'retry' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'retry',
      'args'    => ''
    },
    'discard' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'discard',
      'args'    => ''
    },
    'local' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'local',
      'args'    => ''
    },
    'virtual' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'virtual',
      'args'    => ''
    },
    'lmtp' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'lmtp',
      'args'    => ''
    },
    'anvil' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'anvil',
      'args'    => ''
    },
    'scache' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => '-',
      'chroot'  => 'y',
      'wakeup'  => '-',
      'maxproc' => '1',
      'command' => 'scache',
      'args'    => ''
    },
    'maildrop' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'pipe',
      'args'    => '  flags=DRhu user=vmail argv=/usr/bin/maildrop -d ${recipient}'
    },
    'uucp' => {
      'type'    => 'unix',
      'private' => '-',
      'unpriv'  => 'n',
      'chroot'  => 'n',
      'wakeup'  => '-',
      'maxproc' => '-',
      'command' => 'pipe',
      'args'    => '  flags=Fqhu user=uucp argv=uux -r -n -z -a$sender - $nexthop!rmail ($recipient)'
    },
  }
}
