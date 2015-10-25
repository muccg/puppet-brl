############################################################################
# untested nix setup recipe
#
# this should be invoked from ccg-ops-projects/puppet/brl.pp like so:
#
#   class { 'brl::nixinstall':
#   } =>
#   file { "/brldata/home/.nix-profile":
#     ensure => link,
#     target => "/nix/var/nix/profiles/default"
#     owner => "ccgstaff",
#     group => "ccgstaff"
#   }
#

class brl::nixinstall (
  $user = 'ubuntu',
  ) {

  $packages = "repeat-masker fastq-validator genome-tools maker";

  # Nix 1.10 deb package for Ubuntu 14.04 Trusty (amd64)
  $deb = "nix_1.10-1_amd64.deb";
  $deb_url = "http://hydra.nixos.org/build/25489757/download/1/${deb}";
  $deb_file = "/var/cache/apt/archives/${deb}";

  # CCG fork of nix
  $nixpkgs_clone = "/opt/nixpkgs";

  exec { 'wget nix' :
    command => "/usr/bin/wget -O ${deb_file} ${deb_url}",
    unless  => "test -f ${deb_file}"
  } =>

  package { 'nix':
    provider => 'dpkg',
    source   => $deb_file
  }

  vcsrepo { $nixpkgs_clone:
    ensure    => latest,
    provider  => git,
    source    => "https://bitbucket.org/rvlccg/nixpkgs.git", # anonymous access
    # source    => "git://git@bitbucket.org:ccgmurdoch/nixpkgs.git", # uses deployment key
    # user      => $user   # this user has deployment key in ~/.ssh
  }

  exec { 'nix prepare':
    command  => "nix-channel --add http://nixos.org/channels/nixpkgs-unstable && nix-channel --update",
    provider => shell,
    require  => Package['nix']
  } =>

  file { "/root/.nix-profile":
    ensure => link,
    target => "/nix/var/nix/profiles/default"
  } =>

  exec { 'nix install':
    command => "/usr/bin/nix-env -f ${nixpkgs_clone}/pkgs/top-level/all-packages.nix -i ${packages}",
    require => Vcsrepo[$nixpkgs_clone]
  }
}
