#
class brl::environmentmodules {

  mercurial::clone { 'ccgstarcluster-environment-modules':
    hgroot     => 'https://bitbucket.org/ccgmurdoch/ccgstarcluster-environment-modules',
    revision   => 'default',
    pwd        => '/usr/share/modules/',
    require    => Mercurial::Hgrc['/root/.hgrc'],
  } ->

  exec { 'copy modules into place':
    path    => '/bin:/usr/bin',
    command => 'cp -rp /usr/share/modules/ccgstarcluster-environment-modules/* /usr/share/modules/modulefiles/',
  }

  exec { 'modules init':
    path    => '/bin:/usr/bin',
    command => "echo '. /usr/share/modules/init/bash' >> /etc/profile",
    unless  => 'grep modules /etc/profile',
  }

}
