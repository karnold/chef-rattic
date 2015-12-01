# chef-cacti [![Build Status](https://secure.travis-ci.org/bflad/chef-cacti.png?branch=master)](http://travis-ci.org/bflad/chef-cacti)

## Description

Install/configures Rattis

## Requirements

### Chef

* Chef 12 

### Databases

* MySQL

### Cookbooks

[Opscode Cookbooks](https://github.com/opscode-cookbooks/)

* [apache2](https://github.com/opscode-cookbooks/apache2/)
* [database](https://github.com/opscode-cookbooks/database/)
* [mysql](https://github.com/opscode-cookbooks/mysql/)
* [mysql2_chef_gem](https://supermarket.chef.io/cookbooks/mysql2_chef_gem)

## Attributes

These attributes are under the `node['rattic']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
secretkey | A secret key used by rattic | String | SflkjQ2$AL;DSKJFASLKJFSD
mysql_user | the user to connect to mysql | String | root


### Apache2 Attributes ###

These attributes are under the `node['rattic']['apache2']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
user | The apache user to use | String | www-data
group | The apache group to use | String | www-data
doc_root | The directory to install rattic | String | /var/www/rattic
server_alias | Aliases to use for the virtual host | Array | `[node['hostname']]`
server_name | The virtual host ServerName | String | `node['fqdn']`

These attributes are under the `node['rattic']['apache2']['ssl']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
certificate_file | SSL Certificate File | String | /etc/ssl/certs/ssl-cert-snakeoil.pem
chain_file | SSL Chain File | String | ''
key_file | SSL Key File | String | /etc/ssl/private/ssl-cert-snakeoil.key


## Contributing

Please use standard Github issues/pull requests.

## Contributors

* Kristen Arnold ([@karnold][https://github.com/karnold])

[@karnold]: https://github.com/karnold
