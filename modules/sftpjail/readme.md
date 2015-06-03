#### This module is to setup sftp jailed user.

###### From example folder you can collect an example.pp file for basic initial setup 

###### This module contains following files.


########*[init.pp]*(https://github.com/OpsTree/Puppet/blob/sandeep/modules/sftpjail/manifests/init.pp)

This file conatins initial calls to setup basic configuration of sftp server. It includes install, config and service modules.

########*[install.pp]*(https://github.com/OpsTree/Puppet/blob/sandeep/modules/sftpjail/manifests/install.pp)

It ensures the presence of openssh-server package.

########*[config.pp]*(https://github.com/OpsTree/Puppet/blob/sandeep/modules/sftpjail/manifests/config.pp)

It provides a template for sshd_config file. Create a sftpgroup for users which are using sftp in jailed mode also create a "/sftp" base directory.   

########*[service.pp]*(https://github.com/OpsTree/Puppet/blob/sandeep/modules/sftpjail/manifests/service.pp) 

It ensures the running state of "ssh" service.

########*[user.pp]*(https://github.com/OpsTree/Puppet/blob/sandeep/modules/sftpjail/manifests/user.pp)

This file manage sftpusers. It creates users and define their home directory on the basis of a variable udt i.e. user defined type. This variable diffrentiate between the users by their authentication method i.e key based or password based authentication and also add those users to a default "sftpusers" group.
   
