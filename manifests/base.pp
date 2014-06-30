#
class brl::base {

  include ccgcommon
  include repo::multiverseubuntu

  $absent_packages = ['apache2', 'mysql-server-5.5', 'nginx-full']

  $packages = [ 'dos2unix',
                'libboost-all-dev',
                'libfreetype6', 'libfreetype6-dev',
                'mailutils',
                'python', 'python-setuptools', 'python-pip', 'python-virtualenv', 'python-matplotlib',
                'lib32z1', 'lib32z1-dev', 'libx32z1', 'libx32z1-dev', 'zlib-bin', 'zlib1g', 'zlib1g-dev',
                'cmake',
                'sparsehash', 'libsparsehash-dev',
                'ghc',
                'build-essential',
                'environment-modules',
                'checkinstall',
                #"oracle-java7-installer", # this will not install silently, asks for confirmation
                'emboss', 'blast2', 'fastqc',
                'tcl', 'tcl-dev',
                'hdf5-tools', 'libhdf5-serial-dev',
                'bioperl', 'fasttree', 'hmmer', 'gmap', 'bwa', 'phylip', 'bowtie2', 'bowtie2-examples',
                'bowtie', 'bowtie-examples', 'clustalx', 'seaview',
                'graphviz-doc', 'libmath-random-perl', 'libxml-sax-expatxs-perl', 'libgd-tools',
                'uuid', 'libapache2-mod-perl2', 'libmime-lite-perl', 'libnet-jabber-perl',
                'libperlio-gzip-perl',
                'picard-tools', 'soapdenovo', 'soapdenovo2', 'mira-assembler',
                'tk8.4', 'tk8.4-dev',  # staden
                'circos', 'graphicsmagick',
                'unrar', 'gnuplot-x11',
                'netcdf-bin',  # pyms
                'libnetcdf-dev',  # mzR
                'libglu1-mesa-dev', 'mesa-common-dev',  # rgl
                ]

  package { $packages:
    ensure => installed,
  }

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

  file { '/usr/local':
    ensure => directory;
  }

}
