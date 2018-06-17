execute "yum update" do
  user "root"
  command "yum update --assumeyes"
end

package "bash-completion" do
  action :install
end

package "httpd" do
  action :install
end

service "httpd" do
  action [:enable, :start]
end