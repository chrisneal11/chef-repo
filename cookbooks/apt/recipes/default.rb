#
# Cookbook:: apt
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

execute 'apt-get update' do
  command 'apt-get update'
end

include_recipe 'apt'

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file '/usr/share/nginx/www/index.html' do
  source 'index.html'
end
