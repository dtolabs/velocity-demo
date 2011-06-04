#
# Cookbook Name:: chefrundeck
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

gem_package "chef-rundeck" do
  action :install
end

template "#{node[:rundeck][:dir]}/chefdeck.sh" do
  source "chefdeck.sh.erb"
  owner "rundeck"
  group "sysadmin"
  mode 0755
end


