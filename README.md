[![Build Status - Master](https://travis-ci.org/juju4/ansible-syslogclient.svg?branch=master)](https://travis-ci.org/juju4/ansible-syslogclient)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-syslogclient.svg?branch=devel)](https://travis-ci.org/juju4/ansible-syslogclient/branches)
# Remote syslog client ansible role

A simple ansible role to setup system to send syslog to remote system
For more advanced usage like TLS, you are encouraged to look other roles like [Debops Rsyslog](https://github.com/debops/ansible-rsyslog)

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.syslogclient
```

## Variables

```
syslogclient_server: 10.1.1.1
```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/juju4.syslogclient
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/juju4.syslogclient/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues


## License

BSD 2-clause

