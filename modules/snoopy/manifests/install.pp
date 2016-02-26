class snoopy::install(){
	remote_file { '/tmp/snoopy-install.sh':
		ensure => present,
		source => 'https://github.com/a2o/snoopy/raw/install/doc/install/bin/snoopy-install.sh',
		mode => '755',
	}
	
	exec {'execute_install_script':
		cwd => '/tmp',
		command => '/tmp/snoopy-install.sh stable',
		creates => '/etc/snoopy.ini',
		require => Remote_file['/tmp/snoopy-install.sh'],
	}
}
