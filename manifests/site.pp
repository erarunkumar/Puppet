node /^puppet-server.internal2.adtech.com$/ {
  include roles::rproxy
}

node /^spark-node-\d+\.internal2$/ {
  include roles::spark
}

node /^zookeeper-node-\d+\.internal2$/ {
  include roles::zookeeper
}

node /^cassandra-node-\d+\.internal2$/ {
  include roles::cassandra
}

node /^kafka-node-\d+\.internal2$/ {
  include roles::kafka
}

node /^aerospike-node-\d+\.internal2$/ {
  include roles::aerospike
}

node /^backend.internal2.adtech.com$/ {
  include roles::grizzly
}

node /^frontend.internal2.adtech.com$/ {
  include roles::nodejs
}

node /^adserver.internal2.adtech.com$/ {
  include roles::grizzly
}
node /^rproxy.internal2.adtech.com$/ {
  include roles::rproxy
}

node /^analytics-node-\d+\.internal2$/ {
  include roles::grizzly
}
