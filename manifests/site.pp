node /^puppet-server.internal.adtech.com$/ { include roles::puppetmaster }

node /^spark-node-\d+\.internal$/ { include roles::spark }

node /^zookeeper-node-\d+\.internal$/ { include roles::zookeeper }

node /^cassandra-node-\d+\.internal$/ { include roles::cassandra }

node /^kafka-node-\d+\.internal$/ { include roles::kafka }

node /^aerospike-node-\d+\.internal$/ {  include roles::aerospike }

node /^grizzly.internal.adtech.com$/ {  include roles::grizzly }

node /^backend.internal.adtech.com$/ {  include roles::grizzly }

node /^frontend.internal.adtech.com$/ { 
		include roles::nodejs 
		include roles::zabbix			
}

node /^adserver.internal.adtech.com$/ { include roles::grizzly }

node /^rproxy.internal.adtech.com$/ { include roles::rproxy }

node /^analytics-node-\d+\.internal$/ { include roles::grizzly }

node /^nexus.internal.adtech.com$/ { include roles::nexus }

node /^zabbix.internal.adtech.com$/ { include roles::zabbix }

node /^jenkins.internal.adtech.com$/ {
  include roles::jenkins
  include roles::ansible
}
