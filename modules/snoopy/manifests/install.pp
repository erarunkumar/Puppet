class snoopy::install(){

	package {'wget':}
	
	exec { 'get_snoopy_script':
		cwd => "/tmp",
		command => '/usr/bin/wget https://github.com/a2o/snoopy/raw/install/doc/install/bin/snoopy-install.sh;chmod 755 /tmp/snoopy-install.sh',
		creates => '/tmp/snoopy-install.sh',
		require => Package['wget'],
	}

	exec {'execute_install_script':
		cwd => '/tmp',
		command => '/tmp/snoopy-install.sh stable',
		creates => '/etc/snoopy.ini',
		require => Exec['get_snoopy_script'],
	}
}
