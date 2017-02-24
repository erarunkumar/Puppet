# == Class: profiles::spark_master
#
class profiles::spark_master {
  #class { 'sshkeys::master': }
  class { 'spark':
        spark_env => [ 'SPARK_LOCAL_IP=0.0.0.0', 'SPARK_DAEMON_MEMORY=500m'],
        slave     => ['slave-spark']
  }
}
