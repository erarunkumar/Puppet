# == Class: profiles::fstab
#
class profiles::fstab {
  filesystem { '/dev/xvdb':
    ensure  => present,
    fs_type => 'xfs',
    options => '-b 4096 -E stride=32,stripe-width=64',
  }
  mounts { 'Mount point for ext4':
    ensure  => present,
    source  => '/dev/xvdb',
    dest    => '/mnt/',
    type    => 'xfs',
    opts    => 'nofail,defaults,noatime',
    require => Class['filesystem']
  }
}
