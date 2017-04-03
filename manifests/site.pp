node /^puppet-server.internal.adtech.com$/ {
  include roles::rproxy
}

node /^spark-node-\d+\.internal$/ {
  include roles::spark
}

node /^zookeeper-node-\d+\.internal$/ {
  include roles::zookeeper
}

node /^cassandra-node-\d+\.internal$/ {
  include roles::cassandra
}

node /^kafka-node-\d+\.internal$/ {
  include roles::kafka
}

node /^aerospike-node-\d+\.internal$/ {
  include roles::aerospike
}

node /^backend.internal.adtech.com$/ {
  include roles::grizzly
}

node /^frontend.internal.adtech.com$/ {
  include roles::nodejs
}

node /^adserver.internal.adtech.com$/ {
  include roles::grizzly
}
node /^rproxy.internal.adtech.com$/ {
  include roles::rproxy
}
