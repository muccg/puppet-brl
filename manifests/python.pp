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

  python::pip { 'biopython':
    pkgname => 'biopython',
    require => Package['pip']
  }

  python::pip { 'ctypes':
    pkgname => 'ctypes',
    require => Package['pip']
  }

  python::pip { 'PIL':
    pkgname => 'PIL',
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

  python::pip { 'awscli':
    pkgname => 'awscli',
    require => Package['pip']
  }

  python::pip { 'python-keystoneclient':
    pkgname => 'python-keystoneclient',
    require => Package['pip']
  }

  python::pip { 'python-swiftclient':
    pkgname => 'python-swiftclient',
    require => Package['pip']
  }

  # Dependency of SpeedSeq
  python::pip { 'pysam==0.8.2.1':
    pkgname => 'pysam==0.8.2.1',
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

  python::pip { 'numpy==1.9.2':
    pkgname       => 'numpy==1.9.2',
    virtualenv    => '/usr/local/qiime',
    require       => Python::Virtualenv['/usr/local/qiime']
  }

  python::pip { 'qiime==1.9.1':
    pkgname       => 'qiime==1.9.1',
    virtualenv    => '/usr/local/qiime',
    require       => [Python::Virtualenv['/usr/local/qiime'], Python::Pip['numpy==1.9.2']]
  }

}
