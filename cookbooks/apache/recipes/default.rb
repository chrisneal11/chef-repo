#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
# 1-  install

package 'apache2' do
  case node[:platform]
  when 'redhat','centos'
     package_name 'httpd'
     action    :install
  when 'ubuntu','debian'
     package_name 'apache2'
     action :install
  end
end


# 2 - start apache

service "apache2"  do
  case node[:platform]
  when 'redhat','centos'
     service_name 'httpd'
  when 'ubuntu','debian'
     service_name 'apache2'
  end
  action [ :enable,  :start ]
end

# 3 - serve custom home page

template "/var/www/html/index.html" do 
  source 'index.html.erb'
  mode '0644'
end
