# == Class: azkaban
# === Authors
# Author Name <opstree@opstree.com>

class azkaban{

	$dir =["/opt/azkaban/","/opt/azkaban/webserver/","/opt/azkaban/executerserver"]

	file{"$dir":
		path    => "/opt",
		ensure  => "directory",
		recurse => true,
	}

	include azkaban::mysqluser
	include azkaban::webserver
	include azkaban::executorserver

}

