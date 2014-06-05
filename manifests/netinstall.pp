#
class brl::netinstall ($download_url=undef) {

  puppi::netinstall { 'pycdf':
    url                 => "${download_url}/pycdf-0.6-3b.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'python setup.py install'
  }

  puppi::netinstall { 'Pycluster':
    url                 => "${download_url}/Pycluster-1.52.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'python setup.py install'
  }

  puppi::netinstall { 'pyms':
    url                 => "${download_url}/pyms-r379.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
  }

  puppi::netinstall { 'bowtie2':
    url                 => "${download_url}/bowtie2-2.2.2.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'make'
  }

  puppi::netinstall { 'staden':
    url                 => "${download_url}/staden-2.0.0b9.i686.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
  }

  puppi::netinstall { 'MUMmer':
    url                 => "${download_url}/MUMmer3.23.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'make'
  }

  puppi::netinstall { 'mira':
    url                 => "${download_url}/mira_4.0.2_linux-gnu_x86_64_static.tar.bz2",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
  }

  puppi::netinstall { 'aragorn':
    url                 => "${download_url}/aragorn1.2.36.tgz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'gcc -O3 -ffast-math -finline-functions -o aragorn aragorn1.2.36.c'
  }

  puppi::netinstall { 'amos':
    url                 => "${download_url}/amos-3.1.0-rc1.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    path                => '/usr/local/amos-3.1.0-rc1:/bin:/sbin:/usr/bin:/usr/sbin',
    postextract_command => "sed -i '1s/^/#include <getopt.h>\\n/' src/Align/find-tandem.cc && configure && make && make install"
  }

  puppi::netinstall { 'LSC':
    url                 => "${download_url}/LSC_1_alpha.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'chmod +x *.py && dos2unix /usr/local/LSC_1_alpha/*.py'
  }

  puppi::netinstall { 'VelvetOptimiser':
    url                 => "${download_url}/VelvetOptimiser-2.2.5.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
  }

  # clean up some cruft in the image
  exec { '/bin/rm -rf /usr/local/metavelvet':
    command => '/bin/rm -rf /usr/local/metavelvet',
  } ->

  exec { '/bin/rm -rf /usr/local/bin/meta-velvetg':
    command => '/bin/rm -rf /usr/local/bin/meta-velvetg',
  } ->

  puppi::netinstall { 'MetaVelvet-1.2.02':
    url                 => "${download_url}/MetaVelvet-1.2.02.tgz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => "sed -i 's/DEF = -D MAXKMERLENGTH=$(MAXKMERLENGTH) -D CATEGORIES=$(CATEGORIES)/DEF = -D MAXKMERLENGTH=$(MAXKMERLENGTH) -D CATEGORIES=$(CATEGORIES) -D LONGSEQUENCES/' Makefile && make 'CATEGORIES=4' 'MAXKMERLENGTH=99' 'OPENMP=1' 'BUNDLEDZLIB=1'"
  }

  puppi::netinstall { 'velvet':
    url                 => "${download_url}/velvet_1.2.10.tgz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => "make 'CATEGORIES=4' 'MAXKMERLENGTH=99' 'OPENMP=1' 'BUNDLEDZLIB=1' 'LONGSEQUENCES=1'"
  }

  puppi::netinstall { 'gatk':
    url                 => "${download_url}/gatk-1.6-5.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'bamtools':
    url                 => "${download_url}/bamtools-2.3.0.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'mkdir -p build && cd build && cmake .. && make',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'flash':
    url                 => "${download_url}/FLASH-1.2.9-linux26-x64.tar.gz",
    extracted_dir       => 'FLASH-1.2.9',
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'make'
  }

  puppi::netinstall { 'ray':
    url                 => "${download_url}/Ray-2.3.1.tar.bz2",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'make MAXKMERLENGTH=99 HAVE_LIBZ=y HAVE_LIBBZ2=y'
  }

  puppi::netinstall { 'xstk':
    url                 => "${download_url}/xstk_30May2012.tar.gz",
    extracted_dir       => 'xstk',
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'make'
  }

  puppi::netinstall { 'abyss':
    url                 => "${download_url}/abyss-1.3.7.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    path                => '/usr/local/abyss-1.3.7:/bin:/sbin:/usr/bin:/usr/sbin',
    postextract_command => 'configure && make'
  } ->

  puppi::netinstall { 'quake':
    url                 => "${download_url}/quake-0.3.5.tar.gz",
    extracted_dir       => 'Quake',
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'make -C src'
  }

  puppi::netinstall { 'jellyfish-1.1.11':
    url                 => "${download_url}/jellyfish-1.1.11.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    path                => '/usr/local/jellyfish-1.1.11:/bin:/sbin:/usr/bin:/usr/sbin',
    postextract_command => 'configure && make'
  } ->

  # jellyfish, when called from quake, needs to write to this directory
  file { '/usr/local/jellyfish-1.1.11/bin/.libs/':
      mode => '0777'
  }

  puppi::netinstall { 'jellyfish-2.1.1':
    url                 => "${download_url}/jellyfish-2.1.1.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    path                => '/usr/local/jellyfish-2.1.1:/bin:/sbin:/usr/bin:/usr/sbin',
    postextract_command => 'configure && make'
  }

  file { '/usr/local/Quake/bin/jellyfish':
    ensure  => 'link',
    target  => '/usr/local/jellyfish-1.1.11/bin/jellyfish',
    require => [Puppi::Netinstall['quake'], Puppi::Netinstall['jellyfish-1.1.11']]
  }

  puppi::netinstall { 'quast':
    url                 => "${download_url}/quast-2.3.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'python quast.py --test',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'spades':
    url                 => "${download_url}/SPAdes-3.0.0-Linux.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'msblast':
    url                 => "${download_url}/msblast.tar.gz",
    destination_dir     => '/usr/local/msblast',
    extracted_dir       => '.',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'barcode':
    url                 => "${download_url}/pacbio/PacBioBarcodeCCSDist.zip",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'h5r':
    url                 => "${download_url}/h5r_1.4.1.tar.gz",
    destination_dir     => '/usr/local',
    extracted_dir       => 'h5r',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'R CMD INSTALL .',
    require             => [Class['r'], Class['brl::base']]
  }

  puppi::netinstall { 'pbh5':
    url                 => "${download_url}/pacbio/r-pbh5/R-pbh5-master.tar.gz",
    destination_dir     => '/usr/local',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    postextract_command => 'R CMD INSTALL .',
    require             => [Class['r'], Class['brl::base'], Puppi::Netinstall['h5r']]
  }

  puppi::netinstall { 'wgs':
    url                 => "${download_url}/wgs-7.0-PacBio-Linux-amd64.tar.bz2",
    destination_dir     => '/usr/local',
    extracted_dir       => 'wgs-7.0',
    owner               => 'root',
    group               => 'root',
    work_dir            => '/usr/local/src',
    require             => Class['brl::base']
  }

  # usearch, qiime dependency
  # 32 bit binary
  exec { 'wget usearch' :
    path    => '/usr/bin:/usr/local/bin',
    command => "wget ${download_url}/usearch6.0.152_i86linux32 -O /usr/local/bin/usearch-6.0.152",
    unless  => 'stat /usr/local/bin/usearch-6.0.152'
  }

  # uclust, specific version for qiime
  exec { 'wget uclust' :
    path    => '/usr/bin:/usr/local/bin',
    command => "wget ${download_url}/uclustq1.2.22_i86linux64 -O /usr/local/bin/uclustq-1.2.22",
    unless  => 'stat /usr/local/bin/uclustq-1.2.22'
  }

  file {
    '/usr/local/bin/usearch-6.0.152':
      mode    => '0555',
      require => Exec['wget usearch'];
    '/usr/local/bin/usearch':
      ensure  => link,
      target  => '/usr/local/bin/usearch-6.0.152',
      require => Exec['wget usearch'];
    '/usr/local/bin/uclustq-1.2.22':
      mode    => '0555',
      require => Exec['wget uclust'];
    '/usr/local/bin/uclustq':
      ensure  => link,
      target  => '/usr/local/bin/uclustq-1.2.22',
      require => Exec['wget uclust'];
  }

  exec { 'wget wublast' :
    path    => '/usr/bin:/usr/local/bin',
    cwd     => '/usr/local/wublast',
    command => "wget ${download_url}/blast2.linux26-x64.tar.gz",
    unless  => 'stat blast2.linux26-x64.tar.gz',
    require => File['/usr/local/wublast'],
  }

  exec { 'tar zxvf wublast' :
    path    => '/bin:/usr/bin:/usr/local/bin',
    command => 'tar zxvf blast2.linux26-x64.tar.gz',
    unless  => 'stat wu-blastall',
    cwd     => '/usr/local/wublast',
    require => Exec['wget wublast'],
  }

  file { '/usr/local/wublast':
    ensure => directory
  }

  exec { 'cp PAM30MS' :
    path    => '/bin:/usr/bin',
    command => 'cp /usr/local/msblast/PAM30MS /usr/local/wublast/matrix',
    unless  => 'stat /usr/local/wublast/matrix/PAM30MS',
    require => [Puppi::Netinstall['msblast'], Exec['tar zxvf wublast']],
  }

}
