default['rattic']['secretkey'] = 'SflkjQ2$AL;DSKJFASLKJFSD'
default['rattic']['mysql_user'] = value_for_platform(
  %w(pld) => {
    'default' => 'mysql'
  },
  %w(centos fedora redhat ubuntu) => {
    'default' => 'root'
  }
)

default['rattic']['apache2']['user'] = 'www-data'
default['rattic']['apache2']['group'] = 'www-data'
default['rattic']['apache2']['doc_root'] = '/var/www/rattic'
default['rattic']['apache2']['server_aliases'] = [node['hostname']]
default['rattic']['apache2']['server_name'] = node['fqdn']

default['rattic']['apache2']['ssl']['certificate_file'] = value_for_platform(
  %w(pld) => {
    'default' => '/etc/httpd/ssl/server.crt'
  },
  %w(centos fedora redhat) => {
    'default' => '/etc/pki/tls/certs/localhost.crt'
  },
  %w(debian ubuntu) => {
    'default' => '/etc/ssl/certs/ssl-cert-snakeoil.pem'
  }
)

default['rattic']['apache2']['ssl']['chain_file'] = ''

default['rattic']['apache2']['ssl']['key_file'] = value_for_platform(
  %w(pld) => {
    'default' => '/etc/httpd/ssl/server.key'
  },
  %w(centos fedora redhat) => {
    'default' => '/etc/pki/tls/private/localhost.key'
  },
  %w(debian ubuntu) => {
    'default' => '/etc/ssl/private/ssl-cert-snakeoil.key'
  }
)

default['rattic']['ldap']['enable'] = true
default['rattic']['ldap']['uri'] = 'ldap://localhost'
default['rattic']['ldap']['userbase'] = 'ou=users,dc=example,dc=com'
default['rattic']['ldap']['userfilter'] = '(sAMAccountName=%(user)s)'
default['rattic']['ldap']['groupbase'] = 'ou=django,ou=groups,dc=example,dc=com'
default['rattic']['ldap']['groupfilter'] = '(objectClass=group)'
default['rattic']['ldap']['grouptype'] = 'ActiveDirectoryGroupType'
default['rattic']['ldap']['staff'] = 'cn=staff,ou=groups,dc=example,dc=com'
default['rattic']['ldap']['requirecert'] = 'False'
default['rattic']['ldap']['binddn'] = 'rattic@win.int.tildaslash.com'
default['rattic']['ldap']['bindpw'] = 'R4tticP4ss'