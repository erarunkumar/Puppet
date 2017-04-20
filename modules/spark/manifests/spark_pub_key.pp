# == Class: spark_pub_key
#
class spark::spark_pub_key(
  $sshkeys = ''
  ) {

  file { '/etc/sshkeys/spark@adserver.pub ':
    content => $sshkeys,
  }
}
