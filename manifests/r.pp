#
class brl::r {

  class { 'repo::rdebian': release => 'unstable' }
  include repo::rcran

  $absent_packages = [ 'r-bioc-biocgenerics' ]

  package { $absent_packages:
    ensure => absent
  }

  class { 'r':
    pkg     => 'r-base=3.1.0-1saucy0',
    require => Package[$absent_packages]
  }

  $r_packages = [
    'r-cran-kernsmooth', 'r-cran-foreign', 'r-cran-boot', 'r-cran-cluster', 'r-cran-class',
    'r-cran-mass', 'r-cran-matrix', 'r-cran-mgcv', 'r-cran-nlme', 'r-cran-nnet', 'r-cran-rpart',
    'r-cran-spatial', 'r-cran-vgam', ]

  package { $r_packages:
    ensure  => installed,
    require => Class['r']
  }

  r::biocpackage { 'BiocGenerics': require => Class['r'] } ->
  r::biocpackage { 'Biobase': require => Class['r'] } ->
  r::biocpackage { 'pcaMethods': require => Class['r'] } ->
  r::biocpackage { 'limma': require => Class['r'] } ->
  r::biocpackage { 'statmod': require => Class['r'] } ->

  r::package { 'abind': require => Class['r'], dependencies => true } ->
  r::package { 'gdata': require => Class['r'], dependencies => true } ->
  r::package { 'h5r': require => Class['r'], dependencies => true } ->
  r::package { 'crmn': require => Class['r'], dependencies => true } ->
  r::package { 'metabolomics': require => Class['r'], dependencies => true }
  r::package { 'plotrix': require => Class['r'], dependencies => true }
}
