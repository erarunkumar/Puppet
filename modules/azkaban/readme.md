##### This is a puppet module to setup "azkaban" in two-server mode

**Azkaban** is a open source workflow manager and  job scheduler created at LinkedIn. Azkaban resolves the ordering through job dependencies and provides an easy to use web user interface to maintain and track your workflows.

To setup azkabaan in two-server mode with basic configuration use example.pp from tests folder.

###### This module containes following files 

###### *[init.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/init.pp)*

This file conatins initial calls to setup basic configuration of azkaban in two-server i.e., webserver & executorserver. It includes mysqluser, webserver & executorserver files to acomplish the task.

###### *[mysqluser.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/mysqluser.pp)*

This file setup basic database requirement for azkaban.

###### *[jetty.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/jetty.pp)*

This file creates a ssl keystore (keystore) and corresponding jetty certificate (jetty.csr) for that and place them in "/opt" directory.

###### *[webserver.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/webserver.pp)*

This file is responsible to setup azkaban webserver.

###### *[executorserver.pp](https://github.com/OpsTree/Puppet/blob/saurabh/modules/azkaban/manifests/executorserver.pp)*

This file setup azkaban executor server.
