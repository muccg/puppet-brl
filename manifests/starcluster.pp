#
class brl::starcluster {

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

}
