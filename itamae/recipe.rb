execute "yum update" do
  user "root"
  command "yum update -y --disablerepo='percona-*'"
end

execute "Install the Percona repository" do
  command "yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-6/percona-release-0.1-6.noarch.rpm"
  not_if "yum repolist enabled | grep -E '^percona-release' > /dev/null"
end

package "bash-completion" do
  action :install
end

%w(httpd php).each do |pkg|
  package pkg do
    action :install
  end
end

service "httpd" do
  action [:enable, :start]
end