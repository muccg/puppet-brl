#
class brl::python {

  class { '::python' :
    version    => 'system',
    pip        => 'latest',
    dev        => 'present',
    virtualenv => 'latest',
  }

  python::pip { 'pip':
    pkgname => 'pip',
    ensure  => 'latest',
    require => Class['python']
  }

  package { 'python-matplotlib':
    ensure   => installed,
    require  => Class['python']
  }

  python::pip { 'scipy':  # pyms
    pkgname => 'scipy',
    require => Python::Pip['pip']
  }

  python::pip { 'numpy==1.10.1':
    pkgname => 'numpy',
    ensure  => '1.10.1',
    require => Python::Pip['pip']
  }

  python::pip { 'biopython':
    pkgname => 'biopython',
    require => Python::Pip['pip']
  }

  python::pip { 'Pillow':
    pkgname => 'Pillow',
    require => Python::Pip['pip']
  }

  python::pip { 'distribute==0.6.49':
    pkgname => 'distribute',
    ensure  => '0.6.49',
    require => Python::Pip['pip']
  } ->

  python::pip { 'bcbio-gff==0.4':
    pkgname => 'bcbio-gff',
    ensure  => '0.4',
    require => Python::Pip['pip']
  }

  python::pip { 'awscli':
    pkgname => 'awscli',
    require => Python::Pip['pip']
  }

  python::pip { 'python-keystoneclient':
    pkgname => 'python-keystoneclient',
    require => Python::Pip['pip']
  }

  python::pip { 'python-swiftclient':
    pkgname => 'python-swiftclient',
    require => Python::Pip['pip']
  }

  # Dependency of SpeedSeq
  python::pip { 'pysam==0.8.3':
    pkgname => 'pysam',
    ensure  => '0.8.3',
    require => Python::Pip['pip']
  }

  python::virtualenv { '/usr/local/qiime':
    ensure       => present,
    version      => 'system',
    systempkgs   => false,
    distribute   => false,
    timeout      => 0,
  }

  python::pip { 'qiime numpy==1.10.1':
    pkgname       => 'numpy',
    ensure        => '1.10.1',
    virtualenv    => '/usr/local/qiime',
    require       => Python::Virtualenv['/usr/local/qiime']
  }

  python::pip { 'qiime==1.9.1':
    pkgname       => 'qiime',
    ensure        => '1.9.1',
    virtualenv    => '/usr/local/qiime',
    require       => [Python::Virtualenv['/usr/local/qiime'], Python::Pip['qiime numpy==1.10.1']]
  }

}
