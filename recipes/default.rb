#
# Cookbook Name:: nginx_intermission
# Recipe:: default
#
# Copyright 2014, National Renewable Energy Laboratory
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"
include_recipe "nginx::authorized_ips"

directory "#{node[:nginx][:dir]}/intermission" do
  owner "root"
  group "root"
  mode "0755"
end

bash "install_nginx_intermission" do
  cwd "#{Chef::Config[:file_cache_path]}/nginx_intermission"
  code <<-EOS
    cp intermission.lua #{node[:nginx][:dir]}/intermission/
    cp intermission_helpers.lua #{node[:nginx][:dir]}/intermission/
  EOS
  action :nothing
end

git "#{Chef::Config[:file_cache_path]}/nginx_intermission" do
  repository node[:nginx_intermission][:git_repository]
  revision node[:nginx_intermission][:git_revision]
  action :sync
  notifies :run, "bash[install_nginx_intermission]"
end

template "#{node[:nginx][:dir]}/conf.d/intermission.conf" do
  source "conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :reload, "service[nginx]"
end

template "#{node[:nginx][:dir]}/sites-available/intermission" do
  source "site.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :reload, "service[nginx]"
end

nginx_site "intermission"
