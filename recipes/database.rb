#
# Cookbook Name:: rattic
# Recipe:: database
#
# Copyright 2015, Kristen Arnold
#

mysql2_chef_gem 'default' do
  action :install
end

mysql_client 'default' do   
  action :create   
end

mysql_service 'rattic' do
	port '3306'
	version '5.5'
	initial_root_password node['mysql']['server_root_password']
	action [:create, :start]
end

execute "link mysql socket" do
	command "ln -sf /run/mysql-rattic/* /var/run/mysqld/"
end

database_connection = {
	:host => "localhost",
	:port => 3306,
	:username => node['rattic']['mysql_user'],
	:password => node['mysql']['server_root_password']
}

mysql_database "rattic" do
	connection database_connection
	action :create
end
