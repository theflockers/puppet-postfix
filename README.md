# puppet-postfix

This is a very simple module to configure postfix. Currently it only writes 
`main.cf` but maybe in the future it may do more than this.

## configuration

```
class { 'postfix': 
  cf =>  {
    main => {
      myorigin   => 'foo.bar',
      mynetworks => '127.0.0.0/8 192.168.0.0/24',
    }
  }

``` 
or through `hiera`
```
postfix::cf:
  main: 
    myorigin: foo.bar
    mynetworks: 127.0.0.0/8 192.168.0.0/24
  master:
    - name: something 
      type: unix
      private: '-'
      unpriv:  'n'
      chroot:  'n'
      wakeup:  '-'
      maxproc: '-'
      command: pipe
      args: '  flags=F user=myuser argv=/some/thing'
```
Using hiera some values might need quotes as puppet may try to replace values as
`yes` by `true` what may break postfix.
