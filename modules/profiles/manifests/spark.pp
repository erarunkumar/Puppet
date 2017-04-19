# == Class: profiles::spark
class profiles::spark {
  class { 'sudo': }->
  class { 'spark':  }->
  class { 'sshkeys::install_keypairs': }->
  class { 'sshkeys::authorizes': }
  class { 'spark_dir': }
}
