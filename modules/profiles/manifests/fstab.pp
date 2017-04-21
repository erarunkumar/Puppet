# == Class: profiles::fstab
#
class profiles::fstab {
  mount { "/mnt/data":
      device  => "/dev/sdb1",
      fstype  => "ext4",
      ensure  => "mounted",
      options => "defaults",
      atboot  => "true",
  }
}
