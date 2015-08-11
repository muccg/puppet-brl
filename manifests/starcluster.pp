#
class brl::starcluster {

  $absent_packages = ['libapache2-mod-php', 'apache2', 'mysql-server-5.5', 'nginx-full', 'nginx-common', 'nginx-light']

  file { '/etc/environment':
    content => template('brl/environment');
  }

  # 13.10 replace portmap with rpcbind, starcluster wants to start portmap
  # Put in a symlink if portmap doesn't exist
  # This will be backwards incompatible
  package { 'rpcbind': ensure => installed } ->

  file { '/etc/init.d/portmap':
    ensure => 'link',
    target => '/etc/init.d/rpcbind',
  }

  # clean up some junk in the base image
  exec { 'mysqld stop':
    command => '/usr/sbin/service mysql stop || true',
  } ->

  exec { 'nginx stop':
    command => '/usr/sbin/service nginx stop || true',
  } ->

  exec { 'apache2 stop':
    command => '/usr/sbin/service apache2 stop || true',
  } ->

  package { $absent_packages:
    ensure => absent
  }

}
