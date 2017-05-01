
swap_file::files { 'tmp file swap':
  ensure    => present,
  swapfile  => '/tmp/swapfile',
  add_mount => true,
  swapfilesize => 3246391296,
}

