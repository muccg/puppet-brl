#
class brl::netinstall (
  $download_url    = undef,
  $destination_dir = '/usr/local',
  $work_dir        = '/usr/local/src',
  $owner           = 'root',
  $group           = 'root',
  ) {

  puppi::netinstall { 'soapdevono-trans':
    url                 => "${download_url}/SOAPdenovo-Trans-bin-v1.03.tar.gz",
    destination_dir     => "${destination_dir}/SOAPdenovo-Trans-v1.03",
    extracted_dir       => '.',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => '',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'augustus':
    url                 => "${download_url}/augustus-3.0.2.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make && make install',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'cap3':
    url                 => "${download_url}/cap3.linux.x86_64.tar",
    extracted_dir       => 'CAP3',
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'orthomcl':
    url                 => "${download_url}/orthomclSoftware-v2.0.9.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'EGA_Secure_Download_Client':
    url                 => "${download_url}/EGA_Secure_Download_Client.0.3.5.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'trinity':
    url                 => "${download_url}/trinityrnaseq_r20140413p1.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make'
  } ->

  # jellyfish, when called from trinity, needs to write to this directory
  file { "${destination_dir}/trinityrnaseq_r20140413p1/trinity-plugins/jellyfish/bin/.libs/":
      mode => '0777'
  }

  puppi::netinstall { 'trans-ABySS':
    url                 => "${download_url}/trans-ABySS-v1.4.8_20130916.tar.gz",
    extracted_dir       => 'trans-ABySS-v1.4.8',
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'oases':
    url                 => "${download_url}/oases_0.2.08.tgz",
    extracted_dir       => 'oases_0.2.8',
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => "make oases 'VELVET_DIR=${destination_dir}/velvet_1.2.10' 'CATEGORIES=4' 'MAXKMERLENGTH=99' 'OPENMP=1' 'BUNDLEDZLIB=1' 'LONGSEQUENCES=1'",
    require             => Puppi::Netinstall['velvet'],
  }

  puppi::netinstall { 'freckle':
    url                 => "${download_url}/ccgmurdoch-freckle-fd45bf544929.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => "cd src/libfreckle && make tests && make && make install && cd .. && python setup.py build && python setup.py install",
  }

  puppi::netinstall { 'mauve':
    url                 => "${download_url}/mauve_linux_2.3.1.tar.gz",
    extracted_dir       => 'mauve_2.3.1',
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'blat':
    url                 => "${download_url}/blat-3.5.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'pycdf':
    url                 => "${download_url}/pycdf-0.6-3b.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'python setup.py install'
  }

  file { "${destination_dir}/pycdf":
    ensure  => 'link',
    target  => "${destination_dir}/pycdf-0.6-3b",
    require => Puppi::Netinstall['pycdf']
  }

  puppi::netinstall { 'Pycluster':
    url                 => "${download_url}/Pycluster-1.52.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'python setup.py install'
  }

  puppi::netinstall { 'pyms':
    url                 => "${download_url}/pyms-r379.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  file { "${destination_dir}/pyms":
    ensure  => 'link',
    target  => "${destination_dir}/pyms-r379",
    require => Puppi::Netinstall['pyms']
  }

  puppi::netinstall { 'bowtie2':
    url                 => "${download_url}/bowtie2-2.2.2.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make'
  }

  puppi::netinstall { 'staden':
    url                 => "${download_url}/staden-2.0.0b9.i686.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'MUMmer':
    url                 => "${download_url}/MUMmer3.23.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make'
  }

  puppi::netinstall { 'mira':
    url                 => "${download_url}/mira_4.0.2_linux-gnu_x86_64_static.tar.bz2",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  }

  puppi::netinstall { 'aragorn':
    url                 => "${download_url}/aragorn1.2.36.tgz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'gcc -O3 -ffast-math -finline-functions -o aragorn aragorn1.2.36.c'
  }

  puppi::netinstall { 'amos':
    url                 => "${download_url}/amos-3.1.0-rc1.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    path                => "${destination_dir}/amos-3.1.0-rc1:/bin:/sbin:/usr/bin:/usr/sbin",
    postextract_command => "sed -i '1s/^/#include <getopt.h>\\n/' src/Align/find-tandem.cc && configure && make && make install"
  }

  puppi::netinstall { 'LSC':
    url                 => "${download_url}/LSC_1_alpha.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => "chmod +x *.py && dos2unix ${destination_dir}/LSC_1_alpha/*.py"
  }

  puppi::netinstall { 'VelvetOptimiser':
    url                 => "${download_url}/VelvetOptimiser-2.2.5.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
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
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => "sed -i 's/DEF = -D MAXKMERLENGTH=$(MAXKMERLENGTH) -D CATEGORIES=$(CATEGORIES)/DEF = -D MAXKMERLENGTH=$(MAXKMERLENGTH) -D CATEGORIES=$(CATEGORIES) -D LONGSEQUENCES/' Makefile && make 'CATEGORIES=4' 'MAXKMERLENGTH=99' 'OPENMP=1' 'BUNDLEDZLIB=1'"
  }

  puppi::netinstall { 'velvet':
    url                 => "${download_url}/velvet_1.2.10.tgz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => "make 'CATEGORIES=4' 'MAXKMERLENGTH=99' 'OPENMP=1' 'BUNDLEDZLIB=1' 'LONGSEQUENCES=1'"
  }

  puppi::netinstall { 'gatk':
    url                 => "${download_url}/gatk-1.6-5.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'bamtools':
    url                 => "${download_url}/bamtools-2.3.0.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'mkdir -p build && cd build && cmake .. && make',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'flash':
    url                 => "${download_url}/FLASH-1.2.9-linux26-x64.tar.gz",
    extracted_dir       => 'FLASH-1.2.9',
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make'
  }

  puppi::netinstall { 'ray':
    url                 => "${download_url}/Ray-2.3.1.tar.bz2",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make MAXKMERLENGTH=99 HAVE_LIBZ=y HAVE_LIBBZ2=y'
  }

  puppi::netinstall { 'xstk':
    url                 => "${download_url}/xstk_30May2012.tar.gz",
    extracted_dir       => 'xstk',
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make'
  }

  puppi::netinstall { 'abyss':
    url                 => "${download_url}/abyss-1.3.7.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    path                => "${destination_dir}/abyss-1.3.7:/bin:/sbin:/usr/bin:/usr/sbin",
    postextract_command => 'configure --prefix=/usr/local/abyss/1.3.7 && make install',
  } ->

  puppi::netinstall { 'rnahybrid':
    url                 => "${download_url}/RNAhybrid-2.1.2.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    path                => "${destination_dir}/RNAhybrid-2.1.2:/bin:/sbin:/usr/bin:/usr/sbin",
    postextract_command => 'configure --prefix=/usr/local/RNAhybrid/2.1.2 && make install',
  } ->

  puppi::netinstall { 'quake':
    url                 => "${download_url}/quake-0.3.5.tar.gz",
    extracted_dir       => 'Quake',
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'make -C src'
  }

  puppi::netinstall { 'jellyfish-1.1.11':
    url                 => "${download_url}/jellyfish-1.1.11.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    path                => "${destination_dir}/jellyfish-1.1.11:/bin:/sbin:/usr/bin:/usr/sbin",
    postextract_command => 'configure && make'
  } ->

  # jellyfish, when called from quake, needs to write to this directory
  file { "${destination_dir}/jellyfish-1.1.11/bin/.libs/":
      mode => '0777'
  }

  puppi::netinstall { 'jellyfish-2.1.1':
    url                 => "${download_url}/jellyfish-2.1.1.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    path                => "${destination_dir}/jellyfish-2.1.1:/bin:/sbin:/usr/bin:/usr/sbin",
    postextract_command => 'configure && make'
  }

  file { "${destination_dir}/Quake/bin/jellyfish":
    ensure  => 'link',
    target  => "${destination_dir}/jellyfish-1.1.11/bin/jellyfish",
    require => [Puppi::Netinstall['quake'], Puppi::Netinstall['jellyfish-1.1.11']]
  }

  puppi::netinstall { 'quast':
    url                 => "${download_url}/quast-2.3.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'python quast.py --test',
    require             => Class['brl::base']
  }

  puppi::netinstall { 'spades':
    url                 => "${download_url}/SPAdes-3.0.0-Linux.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'spades35':
    url                 => "${download_url}/SPAdes-3.5.0-Linux.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'msblast':
    url                 => "${download_url}/msblast.tar.gz",
    destination_dir     => "${destination_dir}/msblast",
    extracted_dir       => '.',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'barcode':
    url                 => "${download_url}/pacbio/PacBioBarcodeCCSDist.zip",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'wgs':
    url                 => "${download_url}/wgs-7.0-PacBio-Linux-amd64.tar.bz2",
    destination_dir     => $destination_dir,
    extracted_dir       => 'wgs-7.0',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'qualimap':
    url                 => "${download_url}/qualimap_v2.1.zip",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  $speedseq_ver = "3bbdeaf3"
  $speedseq_home = "${destination_dir}/speedseq-${speedseq_ver}"
  $vep_dir = "${destination_dir}/ensembl-tools-release-79/scripts/variant_effect_predictor"

  puppi::netinstall { 'SpeedSeq':
    # rodney built this from the speedseq git repo (it has submodules)
    url                 => "${download_url}/speedseq-bin-${speedseq_ver}.tar.gz",
    destination_dir     => $destination_dir,
    extracted_dir       => "speedseq-${speedseq_ver}",
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  } ->

  file { "${speedseq_home}/bin/speedseq.config":
    content  => template('brl/speedseq.config'),
  } ->

  file { "${speedseq_home}/annotations/vep_cache":
    ensure => "directory",
    mode => 0777
  }

  puppi::netinstall { 'VariantEffectPredictor':
    url                 => "${download_url}/ensembl-tools-release-79.zip",
    destination_dir     => $destination_dir,
    extracted_dir       => '',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'SNAP':
    url                 => "${download_url}/snap-bin-2013-11-29.tar.gz",
    destination_dir     => $destination_dir,
    extracted_dir       => 'snap-2013-11-29',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  # BRLOPS-617
  puppi::netinstall { 'fastq-screen':
    url                 => "${download_url}/fastq_screen_v0.4.4.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  # BRLOPS-631
  puppi::netinstall { 'maker':
    url                 => "${download_url}/maker-2.31.8-build.tar.gz",
    destination_dir     => $destination_dir,
    extracted_dir       => 'maker-2.31.8',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  }

  puppi::netinstall { 'RepeatMasker':
    url                 => "${download_url}/RepeatMasker-open-4-0-5.tar.gz",
    destination_dir     => $destination_dir,
    extracted_dir       => 'RepeatMasker',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    require             => Class['brl::base']
  } ->

  puppi::netinstall { 'RepeatMasker Libraries':
    url                 => "${download_url}/repeatmaskerlibraries-20140131.tar.gz",
    destination_dir     => "${destination_dir}/RepeatMasker",
    extracted_dir       => 'Libraries',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
  } ->

  file { "${destination_dir}/RepeatMasker/RepeatMaskerConfig.pm":
    content  => template('brl/RepeatMaskerConfig.pm'),
  } ->

  file { "${destination_dir}/bin/RepeatMasker":
    ensure  => link,
    target  => "${destination_dir}/RepeatMasker/RepeatMasker"
  }

  # trf, RepeatMasker dependency
  # 64 bit binary
  exec { 'wget trf' :
    path    => "/usr/bin:${destination_dir}/bin",
    command => "wget ${download_url}/trf404.linux64 -O ${destination_dir}/bin/trf404",
    unless  => "stat ${destination_dir}/bin/trf404"
  }

  # usearch, qiime dependency
  # 32 bit binary
  exec { 'wget usearch' :
    path    => "/usr/bin:${destination_dir}/bin",
    command => "wget ${download_url}/usearch6.0.152_i86linux32 -O ${destination_dir}/bin/usearch-6.0.152",
    unless  => "stat ${destination_dir}/bin/usearch-6.0.152"
  }

  # uclust, specific version for qiime
  exec { 'wget uclust' :
    path    => "/usr/bin:${destination_dir}/bin",
    command => "wget ${download_url}/uclustq1.2.22_i86linux64 -O ${destination_dir}/bin/uclustq-1.2.22",
    unless  => "stat ${destination_dir}/bin/uclustq-1.2.22"
  }

  file {
    "${destination_dir}/bin/usearch-6.0.152":
      mode    => '0555',
      require => Exec['wget usearch'];
    "${destination_dir}/bin/usearch":
      ensure  => link,
      target  => "${destination_dir}/bin/usearch-6.0.152",
      require => Exec['wget usearch'];
    "${destination_dir}/bin/uclustq-1.2.22":
      mode    => '0555',
      require => Exec['wget uclust'];
    "${destination_dir}/bin/uclustq":
      ensure  => link,
      target  => "${destination_dir}/bin/uclustq-1.2.22",
      require => Exec['wget uclust'];
    "${destination_dir}/bin/trf404":
      mode    => '0755',
      require => Exec['wget trf'];
    "${destination_dir}/bin/trf":
      ensure  => link,
      target  => "${destination_dir}/bin/trf404",
      require => Exec['wget trf'];
  }

  exec { 'wget wublast' :
    path    => "/usr/bin:${destination_dir}/bin",
    cwd     => "${destination_dir}/wublast",
    command => "wget ${download_url}/blast2.linux26-x64.tar.gz",
    unless  => 'stat blast2.linux26-x64.tar.gz',
    require => File["${destination_dir}/wublast"],
  }

  exec { 'tar zxvf wublast' :
    path    => "/bin:/usr/bin:${destination_dir}/bin",
    command => 'tar zxvf blast2.linux26-x64.tar.gz',
    unless  => 'stat wu-blastall',
    cwd     => "${destination_dir}/wublast",
    require => Exec['wget wublast'],
  }

  file { "${destination_dir}/wublast":
    ensure => directory
  }

  exec { 'cp PAM30MS' :
    path    => '/bin:/usr/bin',
    command => "cp ${destination_dir}/msblast/PAM30MS /usr/local/wublast/matrix",
    unless  => "stat ${destination_dir}/wublast/matrix/PAM30MS",
    require => [Puppi::Netinstall['msblast'], Exec['tar zxvf wublast']],
  }

}
