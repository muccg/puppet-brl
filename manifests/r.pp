#
class brl::r (
  $download_url    = undef,
  $destination_dir = '/usr/local',
  $work_dir        = '/usr/local/src',
  $owner           = 'root',
  $group           = 'root',
  ) {

  class { 'repo::rdebian': release => 'unstable' }
  include repo::rcran

  $absent_packages = [ 'r-bioc-biocgenerics' ]

  package { $absent_packages:
    ensure => absent
  }

  class { '::r':
    pkg     => 'r-base-core',
    ensure  => '3.1.3-1trusty',
    require => Package[$absent_packages],
  }

  $r_packages = [
    'r-cran-kernsmooth', 'r-cran-foreign', 'r-cran-boot', 'r-cran-cluster', 'r-cran-class',
    'r-cran-mass', 'r-cran-matrix', 'r-cran-mgcv', 'r-cran-nlme', 'r-cran-nnet', 'r-cran-rpart',
    'r-cran-spatial', 'r-cran-vgam', 'r-cran-getopt',
    'r-cran-optparse', 'r-cran-xml', ]

  package { $r_packages:
    ensure  => installed,
    require => Class['::r']
  }

  r::biocpackage { 'Rsamtools': require => Class['::r'] } ->
  r::biocpackage { 'rtracklayer': require => Class['::r'] } ->
  r::biocpackage { 'BiocGenerics': require => Class['::r'] } ->
  r::biocpackage { 'Biobase': require => Class['::r'] } ->
  r::biocpackage { 'pcaMethods': require => Class['::r'] } ->
  r::biocpackage { 'limma': require => Class['::r'] } ->
  r::biocpackage { 'statmod': require => Class['::r'] } ->
  r::biocpackage { 'mzR': require => Class['::r'] } ->
  r::biocpackage { 'xcms': require => Class['::r'] } ->
  r::biocpackage { 'multtest': require => Class['::r'] } ->
  r::biocpackage { 'CAMERA': require => Class['::r'] } ->
  r::biocpackage { 'GenomicRanges': require => Class['::r'] } ->
  r::biocpackage { 'NOISeq': require => Class['::r'] } ->
  r::biocpackage { 'aroma.light': require => Class['::r'] } ->
  r::biocpackage { 'affxparser': require => Class['::r'] } ->
  r::biocpackage { 'Repitools': require => Class['::r'] } ->

  r::package { 'argparse': require => Class['::r'], dependencies => true } ->
  r::package { 'caret': require => Class['::r'], dependencies => true } ->
  r::package { 'gplots': require => Class['::r'], dependencies => true } ->
  r::package { 'e1071': require => Class['::r'], dependencies => true } ->
  r::package { 'rgl': require => Class['::r'], dependencies => true } ->
  r::package { 'plsgenomics': require => Class['::r'], dependencies => true } ->
  r::package { 'agricolae': require => Class['::r'], dependencies => true } ->
  r::package { 'abind': require => Class['::r'], dependencies => true } ->
  r::package { 'gdata': require => Class['::r'], dependencies => true } ->
  r::package { 'crmn': require => Class['::r'], dependencies => true } ->
  r::package { 'metabolomics': require => Class['::r'], dependencies => true } ->
  r::package { 'plotrix': require => Class['::r'], dependencies => true }
  r::package { 'gridExtra': require => Class['::r'], dependencies => true } ->
  r::package { 'plyr': require => Class['::r'], dependencies => true } ->

  puppi::netinstall { 'MAIT':
    url                 => "${download_url}/MAIT_0.16.tar.gz",
    destination_dir     => $destination_dir,
    extracted_dir       => 'MAIT',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'R CMD INSTALL .',
    require             => [Class['::r'], Class['brl::base']]
  }

  puppi::netinstall { 'h5r':
    url                 => "${download_url}/h5r_1.4.1.tar.gz",
    destination_dir     => $destination_dir,
    extracted_dir       => 'h5r',
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'R CMD INSTALL .',
    require             => [Class['::r'], Class['brl::base']]
  }

  puppi::netinstall { 'pbh5':
    url                 => "${download_url}/pacbio/r-pbh5/R-pbh5-master.tar.gz",
    destination_dir     => $destination_dir,
    owner               => $owner,
    group               => $group,
    work_dir            => $work_dir,
    postextract_command => 'R CMD INSTALL .',
    require             => [Class['::r'], Class['brl::base'], Puppi::Netinstall['h5r']]
  }
}
