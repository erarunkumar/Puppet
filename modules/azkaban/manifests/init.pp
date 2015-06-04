# == Class: azkaban
# === Authors
# Author Name <opstree@opstree.com>

class azkaban{


Exec {
    path => [
            '/usr/local/bin',
            '/opt/local/bin',
            '/usr/bin',
            '/usr/sbin',
            '/bin',
            '/sbin'],
            logoutput => true,
  }

	$dir =["/opt/azkaban/","/opt/azkaban/webserver/","/opt/azkaban/executerserver"]

	file{"$dir":
		path    => "/opt",
		ensure  => "directory",
		recurse => true,
	}

	include azkaban::mysqluser
	include azkaban::jetty
	include azkaban::webserver
	include azkaban::executorserver

}

