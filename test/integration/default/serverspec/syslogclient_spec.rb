require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('rsyslog') do
  it { should be_enabled }
end

describe process("rsyslogd"), :if => os[:family] == 'ubuntu' do
  its(:user) { should eq "syslog" }
  it { should be_running }
end
describe process("rsyslogd"), :if => os[:family] == 'redhat' do
  its(:user) { should eq "root" }
  it { should be_running }
end

describe file('/etc/rsyslog.d/50-default.conf'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_file }
end
describe file('/etc/rsyslog.d/10-remotesyslog.conf') do
  it { should be_file }
  its(:content) { should match /\*.\*     @10.1.1.1/ }
end

describe file('/var/log/syslog'), :if => os[:family] == 'ubuntu' do
  it { should be_file }
  its(:content) { should_not match /open error: Permission denied/ }
  its(:content) { should_not match /syslogd: action 'action .*' resumed/ }
  its(:content) { should_not match /syslogd: action 'action .*' suspended/ }
end

describe file('/var/log/messages'), :if => os[:family] == 'redhat' do
  it { should be_file }
  its(:content) { should_not match /open error: Permission denied/ }
  its(:content) { should_not match /syslogd: action 'action .*' resumed/ }
  its(:content) { should_not match /syslogd: action 'action .*' suspended/ }
end

## with server set
#logger TroubleshootingTest
#echo test | logger -t mytest -d -n 10.1.1.1
#echo test | logger -t mytest -T -n 10.1.1.1 -P 514 ## Port required
