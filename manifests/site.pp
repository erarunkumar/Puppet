node /^spark-node-\d+\.internal$/ {
  include roles::spark
}
node /^zookeeper-node-\d+\.internal$/ {
  include roles::zookeeper
}

node /^cassandra-node-\d+\.internal$/ {
  include roles::cassandra
}
