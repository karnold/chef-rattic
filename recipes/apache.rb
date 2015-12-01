#
# Cookbook Name:: rattic
# Recipe:: default
#
# Copyright 2015, Kristen Arnold
#

include_recipe 'apache2'
include_recipe 'apache2::mpm_prefork'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_wsgi'

template "#{node['apache']['dir']}/sites-available/rattic.conf" do
	source "rattic.conf.erb"
	owner node['rattic']['apache2']['user']
	group node['rattic']['apache2']['group']
	notifies :restart, 'service[apache2]', :delayed
end

apache_site 'rattic' do
  action :enable
  notifies :restart, 'service[apache2]', :delayed
end