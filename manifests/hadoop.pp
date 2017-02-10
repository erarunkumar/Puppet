$master_hostname='spark'
class{'spark':
  master_hostname        => $master_hostname,
  hdfs_hostname          => $master_hostname,
  yarn_enable            => false,
}
include spark::master
include spark::hdfs
