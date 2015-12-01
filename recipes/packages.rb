#
# Cookbook Name:: rattic
# Recipe:: packages
#
# Copyright 2015, Kristen Arnold
#

%w(python-pip python-dev build-essential libxslt1-dev libldap2-dev libssl-dev libsasl2-dev libxml2-dev).each do |cb|
  package cb do
  	action :install
  end
end

execute "update pip" do
	command "pip install --upgrade pip"
end