#
# Cookbook Name:: rundeck
# Recipe:: knife
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{ libxml2-dev libxslt1-dev }.each do |pkg|
  package pkg
end

gem_package "knife-ec2" do
  action :install
end

cookbook_file "#{node[:rundeck][:homedir]}/scripts.tar" do
  source "scripts.tar"
  owner "rundeck"
  group "sysadmin"
  mode "0600"
end

#execute "untar-scripts-repo" do
#  cwd node[:rundeck][:homedir]
#  command "tar --strip-components 1 -xvf scripts.tar"
#  creates "#{node[:rundeck][:homedir]}/scripts"
#end


cookbook_file "#{node[:rundeck][:homedir]}/chef-repo.tar" do
  source "chef-repo.tar"
  owner "rundeck"
  group "sysadmin"
  mode "0600"
end

#execute "untar-chef-repo" do
#  cwd node[:rundeck][:homedir]
#  command "tar --strip-components 1 -xvf chef-repo.tar"
#  creates "#{node[:rundeck][:homedir]}/chef-repo"
#end

cookbook_file "#{node[:rundeck][:homedir]}/dotchef.tar" do
  source "dotchef.tar"
  owner "rundeck"
  group "sysadmin"
  mode "0600"
end

#execute "untar-dotchef" do
#  cwd node[:rundeck][:homedir]
#  command "tar --strip-components 1 -xvf dotchef.tar"
#  creates "#{node[:rundeck][:homedir]}/.chef"
#end


