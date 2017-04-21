# == Class: profiles::fstab
#
class profiles::fstab {
  mounts { 'Mount point for ext4':
    ensure => present,
    source => '/dev/xvdb',
    dest   => '/mnt/data',
    type   => 'ext4',
    opts   => 'nofail,defaults,noatime',
  }
}
