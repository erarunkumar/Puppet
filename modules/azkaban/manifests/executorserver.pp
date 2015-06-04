class azkaban::executorserver{

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
        include stdlib
	exec{"executorserver":
		command =>'wget -P /opt/azkaban/executorserver/ https://s3.amazonaws.com/azkaban2/azkaban2/2.5.0/azkaban-executor-server-2.5.0.tar.gz',
		creates => '/opt/azkaban/executorserver/azkaban-executor-server-2.5.0.tar.gz',
		require => [Class['java'],Class['azkaban'],Class['azkaban::mysqluser']],
	}

	exec{"tarexecutorserver":
		command =>'tar -xzf /opt/azkaban/executorserver/azkaban-executor-server-2.5.0.tar.gz -C /opt/azkaban/executorserver/',
		creates => '/opt/azkaban/executorserver/azkaban-executor-2.5.0',
		require => Exec['executorserver'],
	}
	
	exec{"exejavaconnector":
                command =>'wget -P /opt/ http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.35.tar.gz',
		creates => '/opt/mysql-connector-java-5.1.35.tar.gz',
        }
	
	file{"/opt/azkaban/executorserver/azkaban-executor-2.5.0/extlib/mysql-connector-java-5.1.35.tar.gz":
		ensure  =>'file',
		source  =>'/opt/mysql-connector-java-5.1.35.tar.gz',
		require => [Exec['tarexecutorserver'],Exec['exejavaconnector']],
	}

	file_line {"databaseconfiguration":
		path     => "/opt/azkaban/executorserver/azkaban-executor-2.5.0/conf/azkaban.properties",
		ensure   => present,
		line     => "mysql.database=azkaban",
		match    => "mysql.database=azkaban2",
		require  => Exec['tarexecutorserver'],
	}

	exec{"runexecutorserver":
		command => "bash -c 'bin/azkaban-executor-start.sh'",
		cwd     =>  "/opt/azkaban/executorserver/azkaban-executor-2.5.0",
		unless  => "netstat -plannet| grep 12321",
		require => [Exec['tarexecutorserver'],File_line['databaseconfiguration']],
	}
}
