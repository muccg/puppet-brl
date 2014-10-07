#
class brl::base {

  include ccgcommon
  include repo::multiverseubuntu
  include perl

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
                'graphviz-doc', 'libxml-sax-expatxs-perl', 'libgd-tools',
                'uuid', 'libapache2-mod-perl2', 'libmime-lite-perl', 'libnet-jabber-perl',
                'libperlio-gzip-perl',
                'picard-tools', 'soapdenovo', 'soapdenovo2', 'mira-assembler',
                'tk8.4', 'tk8.4-dev',  # staden
                'circos', 'graphicsmagick',
                'unrar', 'gnuplot-x11',
                'netcdf-bin',  # pyms
                'libnetcdf-dev',  # mzR
                'libglu1-mesa-dev', 'mesa-common-dev',  # rgl
                'libcurl4-gnutls-dev',  # required to build R curl module
                'gdc',
                'ncbi-blast+',
                'genometools',
                'xpdf',
                ]

  package { $packages:
    ensure => installed,
  }

  perl::cpan::module { 'Math::Random': }

  file { '/usr/local':
    ensure => directory;
  }

}
