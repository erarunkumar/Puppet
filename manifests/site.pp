# To generate ssh keys on the puppet master
node 'www.example.com' {
  $key_hash = {
    'spark@spark-master' => {},
  }
  class { 'sshkeys::master':
    key_hash => $key_hash
  }
}
# spark master setup
node 'master-spark' {
  java::oracle { 'jre8' :
    ensure  => 'present',
    version => '8',
    java_se => 'jre',
  }
#  sshkeys::install_keypair { "spark@spark-master":
#    source => '/etc/sshkeys/spark@spark-master'
#  }
#  sshkeys::known_host{ "spark@slave-spark": }
  class { 'spark':
        spark_env => [ 'SPARK_LOCAL_IP=0.0.0.0', 'SPARK_DAEMON_MEMORY=500m'],
        slave     => ['slave-spark']
  }
}

# spark worker setup
node 'slave-spark' {
  java::oracle { 'jre8' :
    ensure  => 'present',
    version => '8',
    java_se => 'jre',
  } ->
  class { 'spark':
    spark_env => [ 'SPARK_LOCAL_IP=0.0.0.0', 'SPARK_DAEMON_MEMORY=500m'],
    slave     => ['slave-spark']
  }->
  sshkeys::authorize { 'spark':
    authorized_keys => [
      'spark@spark-master'
    ],
  }
}

node /^adtech-spark-\w+\.internal$/ {
  include roles::spark
}
node 'adtech-aerospike-master' {
  include roles::aerospike
}
node 'adtech-aerospike-slave' {
  include roles::aerospike
}
