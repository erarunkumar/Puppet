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

node /^adtech-forntend-\w+\.internal$/ {
  include roles::aerospike
}
