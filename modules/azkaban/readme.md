##### This is a puppet module to setup "azkaban" in two-server mode

######## **This module needs to setup a keystore for ssl as dependency.**
Go to azkaban official [documentation](http://azkaban.github.io/azkaban/docs/2.5/) to get KeyStore for SSL or you can follow these commands.

*keytool -keystore keystore -alias jetty -genkey -keyalg RSA*

*keytool -certreq -alias jetty -keystore keystore -file jetty.csr*

And place that keystore and jetty.csr file in /opt directory. 



###### This module containes following files 

###### *[init.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/init.pp)*

This file conatins initial calls to setup basic configuration of azkaban in two-server i.e., webserver & executorserver. It includes mysqluser, webserver & executorserver files to acomplish the task.

###### *[mysqluser.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/mysqluser.pp)*

This file setup basic database requirement for azkaban.

###### *[webserver.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/webserver.pp)*

This file is responsible to setup azkaban webserver.

###### *[executorserver.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/executorserver.pp)*

This file setup azkaban executor server.
