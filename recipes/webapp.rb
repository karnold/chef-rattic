#
# Cookbook Name:: rattic
# Recipe:: webapp
#
# Copyright 2015, Kristen Arnold
#

cookbook_file "/tmp/RatticWeb-1.3.1.tar.gz" do
	source "RatticWeb-1.3.1.tar.gz"
	owner "administrator"
end

execute "extract rattic" do
	command "tar zxvf /tmp/RatticWeb-1.3.1.tar.gz -C /tmp"
end

execute "move rattic" do
	command "mv -f /tmp/RatticWeb-1.3.1 #{node['rattic']['apache2']['doc_root']}"
	not_if do ::File.exists?(node['rattic']['apache2']['doc_root']) end
end

execute "change permissions" do
	command "chown -R #{node['rattic']['apache2']['user']}:#{node['rattic']['apache2']['group']} #{node['rattic']['apache2']['doc_root']}"
end

template "#{node['rattic']['apache2']['doc_root']}/wsgi.py" do
	source "wsgi.py.erb"
	owner node['rattic']['apache2']['user']
	group node['rattic']['apache2']['group']
	mode 00755
end

template "#{node['rattic']['apache2']['doc_root']}/conf/local.cfg" do
	source "local.cfg.erb"
	owner node['rattic']['apache2']['user']
	group node['rattic']['apache2']['group']
	mode 00644
end

cookbook_file "#{node['rattic']['apache2']['doc_root']}/package-version.patch"

execute "patch requirements" do
	cwd node['rattic']['apache2']['doc_root']
	command "patch < package-version.patch"
	ignore_failure true
end

directory "#{node['rattic']['apache2']['doc_root']}/static" do
	owner node['rattic']['apache2']['user']
	group node['rattic']['apache2']['group']
end

execute "install requirements" do
	command "pip install -r #{node['rattic']['apache2']['doc_root']}/requirements-base.txt"
end

execute "install pip mysql requirements" do
	command "pip install -r #{node['rattic']['apache2']['doc_root']}/requirements-mysql.txt"
end

execute "sync rattic db" do
	cwd node['rattic']['apache2']['doc_root']
	command "./manage.py syncdb --noinput"
end

execute "migrate rattic" do
	cwd node['rattic']['apache2']['doc_root']
	command "./manage.py migrate --all"
end

execute "compile messages" do
	cwd node['rattic']['apache2']['doc_root']
	command "./manage.py compilemessages"
end

execute "collect static content" do
	cwd node['rattic']['apache2']['doc_root']
	command "./manage.py collectstatic -c --noinput"
end

execute "create default account" do
	cwd node['rattic']['apache2']['doc_root']
	command "./manage.py demosetup && touch /var/run/rattic-setup"
	not_if do ::File.exists?("/var/run/rattic-setup") end
end