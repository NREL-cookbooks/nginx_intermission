#
# Cookbook Name:: nginx_intermission
# Recipe:: torquebox_suspend_restart
#
# Copyright 2014, National Renewable Energy Laboratory
#
# All rights reserved - Do Not Redistribute
#

include_recipe "curl"

template "/usr/local/bin/torquebox_suspend_restart" do
  source "torquebox_suspend_restart.erb"
  owner "root"
  group "root"
  mode "0700"
end
