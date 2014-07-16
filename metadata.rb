name             'nginx_intermission'
maintainer       'National Renewable Energy Laboratory'
maintainer_email 'nick.muerdter@nrel.gov'
license          'All rights reserved'
description      'Installs/Configures nginx_intermission'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "nginx"
depends "rbenv"
