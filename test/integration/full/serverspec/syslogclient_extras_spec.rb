require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/etc/rsyslog.d/49-bash2syslog.conf') do
  it { should be_file }
end
describe file('/etc/rsyslog.d/ansible.conf') do
  it { should be_file }
end
describe file('/etc/rsyslog.d/iptables.conf') do
  it { should be_file }
end
