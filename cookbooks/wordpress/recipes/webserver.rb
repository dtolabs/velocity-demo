#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2009-2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apache2"
include_recipe "mysql::client"

if node.has_key?("ec2")
  server_fqdn = node.ec2.public_hostname
else
  server_fqdn = node.fqdn
end

remote_file "#{Chef::Config[:file_cache_path]}/wordpress-#{node[:wordpress][:version]}.tar.gz" do
  checksum node[:wordpress][:checksum]
  source "http://wordpress.org/wordpress-#{node[:wordpress][:version]}.tar.gz"
  mode "0644"
end

directory "#{node[:wordpress][:dir]}" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

execute "untar-wordpress" do
  cwd node[:wordpress][:dir]
  command "tar --strip-components 1 -xzf #{Chef::Config[:file_cache_path]}/wordpress-#{node[:wordpress][:version]}.tar.gz"
  creates "#{node[:wordpress][:dir]}/wp-settings.php"
end

log "Navigate to 'http://#{server_fqdn}/wp-admin/install.php' to complete wordpress installation" do
  action :nothing
end

  # Find the database master
results = search("node", "role:#{node['webserver']['server_role']}") || []
dbm = results[0]

  # Assuming we have one...

if dbm

  if dbm.has_key?("ec2")
    database_server = dbm.ec2.public_hostname
  else
    database_server =  dbm.ipaddress
  end


  template "#{node[:wordpress][:dir]}/wp-config.php" do
    source "wp-config-webserver.php.erb"
    owner "root"
    group "root"
    mode "0644"
    if dbm.has_key?("wordpress")
       variables(
        :host            => database_server,
        :database        => dbm[:wordpress][:db][:database],
        :user            => dbm[:wordpress][:db][:user],
        :password        => dbm[:wordpress][:db][:password],
        :auth_key        => dbm[:wordpress][:keys][:auth],
        :secure_auth_key => dbm[:wordpress][:keys][:secure_auth],
        :logged_in_key   => dbm[:wordpress][:keys][:logged_in],
        :nonce_key       => dbm[:wordpress][:keys][:nonce]
      )
    end
  notifies :write, resources(:log => "Navigate to 'http://#{server_fqdn}/wp-admin/install.php' to complete wordpress installation")
end
else
    Chef::Log.warn("No node with role #{node['webserver']['server_role']}, database.yml not rendered!")
end

include_recipe %w{php::php5 php::module_mysql}

web_app "wordpress" do
  template "wordpress.conf.erb"
  docroot "#{node[:wordpress][:dir]}"
  server_name server_fqdn
  server_aliases node.fqdn
end

apache_site "000-default" do
  enable false
end

