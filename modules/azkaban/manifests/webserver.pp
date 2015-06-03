class azkaban::webserver{

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
        include java

	exec{"webserver":
		command =>'wget -P /opt/azkaban/webserver/ https://s3.amazonaws.com/azkaban2/azkaban2/2.5.0/azkaban-web-server-2.5.0.tar.gz',
		creates => '/opt/azkaban/webserver/azkaban-web-server-2.5.0.tar.gz',
		require => [Class['java'],Class['azkaban']],
	}

	exec{"tarwebserver":
		command =>'tar -xzf /opt/azkaban/webserver/azkaban-web-server-2.5.0.tar.gz -C /opt/azkaban/webserver/',
		creates => '/opt/azkaban/webserver/azkaban-web-2.5.0',
		require => Exec['webserver'],
	}
	
	file{"/opt/azkaban/webserver/azkaban-web-2.5.0/keystore":
		ensure =>'file',
		source  =>'/opt/keystore',
		require => Exec['tarwebserver'],
	}

	file{"/opt/azkaban/webserver/azkaban-web-2.5.0/jetty":
		ensure =>'file',
		source  =>'/opt/jetty.csr',
		require => Exec['tarwebserver'],
	}

	exec{"javaconnector":
                command =>'wget -P /opt/ http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.35.tar.gz',
		creates => '/opt/mysql-connector-java-5.1.35.tar.gz',
        }

	file{"/opt/azkaban/webserver/azkaban-web-2.5.0/extlib/mysql-connector-java-5.1.35.tar.gz":
		ensure =>'file',
		source  =>'/opt/mysql-connector-java-5.1.35.tar.gz',
		require => [Exec['tarwebserver'],Exec['javaconnector']],
	}

	exec{"runwebserver":
		command => "bash -c 'bin/azkaban-web-start.sh'",
		cwd     =>  "/opt/azkaban/webserver/azkaban-web-2.5.0/",
		require => [File['/opt/azkaban/webserver/azkaban-web-2.5.0/keystore'],File['/opt/azkaban/webserver/azkaban-web-2.5.0/jetty']],
	}

}
