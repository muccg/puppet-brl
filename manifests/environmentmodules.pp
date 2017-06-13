#
class brl::environmentmodules {

  vcsrepo { '/usr/share/modules/modulefiles':
    ensure   => latest,
    provider => git,
    source   => 'git@github.com-ccg-starcluster-environment-modules:muccg/ccg-starcluster-environment-modules.git',
    revision => 'master',
    user     => 'ubuntu',
  }

  exec { 'modules init':
    path    => '/bin:/usr/bin',
    command => "echo '. /usr/share/modules/init/bash' >> /etc/profile",
    unless  => 'grep modules /etc/profile',
  }

}
