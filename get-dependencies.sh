#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
[ ! -d $rolesdir/juju4.gpgkey_generate ] && git clone https://github.com/juju4/ansible-gpgkey_generate $rolesdir/juju4.gpgkey_generate
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.syslogclient ] && ln -s ansible-syslogclient $rolesdir/juju4.syslogclient
[ ! -e $rolesdir/juju4.syslogclient ] && cp -R $rolesdir/ansible-syslogclient $rolesdir/juju4.syslogclient

## don't stop build on this script return code
true
