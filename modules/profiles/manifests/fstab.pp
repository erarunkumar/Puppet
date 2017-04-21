# == Class: profiles::fstab
#
class profiles::fstab {
  exec {'filesystem':
    command => '/sbin/mkfs.xfs /dev/xvdb',
    unless  => '/sbin/blkid -t TYPE=ext4 /dev/vdc'
  }
  mounts { 'Mount point for ext4':
    ensure  => present,
    source  => '/dev/xvdb',
    dest    => '/mnt/',
    type    => 'xfs',
    opts    => 'nofail,defaults,noatime',
    require => Exec['filesystem']
  }
}
