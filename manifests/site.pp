node /^adtech-cassandra-\w+\.internal$/ {
  include roles::spark
}

node /^adtech-spark-\w+\.internal$/ {
  include roles::spark
}

node /^adtech-adserver-\w+\.internal$/ {
  include roles::java
}

node /^adtech-aerospike-\w+\.internal$/ {
  include roles::aerospike
}

node /^adtech-frontend-\w+\.internal$/ {
  include roles::nodejs
}

node /^adtech-zookeeper-\w+\.internal$/ {
  include roles::zookeeper
}

node /^adtech-backend-\w+\.internal$/ {
  include roles::java
}

node /^adtech-kafka-\w+\.internal$/ {
  include roles::kafka
}
