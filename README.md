[![Actions Status - Main](https://github.com/juju4/ansible-syslogclient/workflows/AnsibleCI/badge.svg)](https://github.com/juju4/ansible-syslogclient/actions?query=branch%3Amain)
[![Actions Status - Devel](https://github.com/juju4/ansible-syslogclient/workflows/AnsibleCI/badge.svg?branch=devel)](https://github.com/juju4/ansible-syslogclient/actions?query=branch%3Adevel)
# Remote syslog client ansible role

A simple ansible role to setup system to send syslog to remote system
For more advanced usage like TLS, you are encouraged to look other roles like [Debops Rsyslog](https://github.com/debops/ansible-rsyslog)

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.4
 * 2.5

### Operating systems

Tested Ubuntu 14.04, 16.04, 18.04 and centos7

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

* RedHat/RockyLinux 9: `rsyslog internal message (3,-2455): could not transfer  the  specified  internal posix  capabilities settings to the kernel, capng_apply=-5`
  * https://bugzilla.redhat.com/show_bug.cgi?id=2216919
  * https://github.com/rsyslog/rsyslog/issues/5159
  * https://github.com/ansible/awx/issues/13412
  * https://bugs.launchpad.net/tripleo/+bug/2003777
  * https://www.syslog-ng.com/community/b/blog/posts/working-around-linux-capabilities-problems-for-syslog-ng

## Other references

* https://insights.ubuntu.com/wp-content/uploads/Whitepaper-CentralisedLogging-v11.pdf

## License

BSD 2-clause
