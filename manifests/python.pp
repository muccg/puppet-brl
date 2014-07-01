#
class brl::python {

  package { 'pip':
    ensure   => latest,
    provider => pip,
    require  => Class['brl::base']
  }

  python::pip { 'scipy':  # pyms
    pkgname => 'scipy',
    require => Package['pip']
  }

  python::pip { 'numpy==1.8.1':
    pkgname => 'numpy==1.8.1',
    require => Package['pip']
  }

  python::pip { 'distribute>=0.6.49':
    pkgname => 'distribute>=0.6.49',
    require => Package['pip']
  } ->

  python::pip { 'bcbio-gff==0.4':
    pkgname => 'bcbio-gff==0.4',
    require => Package['pip']
  }

  python::pip { 'awscli==1.3.7':
    pkgname => 'awscli==1.3.7',
    require => Package['pip']
  }

  python::pip { 'python-keystoneclient==0.8.0':
    pkgname => 'python-keystoneclient==0.8.0',
    require => Package['pip']
  }

  python::pip { 'python-swiftclient==2.0.3':
    pkgname => 'python-swiftclient==2.0.3',
    require => Package['pip']
  }

  python::virtualenv { '/usr/local/qiime':
    ensure       => present,
    version      => 'system',
    systempkgs   => false,
    distribute   => false,
    cwd          => '/usr/local/qiime',
    timeout      => 0,
    require      => [Package['pip'], Class['brl::base']]
  }

  python::pip { 'numpy==1.7.1':
    pkgname       => 'numpy==1.7.1',
    virtualenv    => '/usr/local/qiime',
    require       => Python::Virtualenv['/usr/local/qiime']
  }

  python::pip { 'qiime':
    pkgname       => 'qiime',
    virtualenv    => '/usr/local/qiime',
    require       => [Python::Virtualenv['/usr/local/qiime'], Python::Pip['numpy==1.7.1']]
  }

}
