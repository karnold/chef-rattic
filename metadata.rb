name             'rattic'
maintainer       'SFMOMA'
maintainer_email 'karnold@sfmoma.org'
license          'All rights reserved'
description      'Installs/Configures rattic'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends "apache2"
depends "database"
depends "mysql"
depends "mysql2_chef_gem"
