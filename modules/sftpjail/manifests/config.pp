class sftpjail::config() {
	# SFTP Configuration
	file { "/etc/ssh/sshd_config" :
		ensure          => present,
		notify          => Class['sftpjail::service'],
		mode            => '0644',
		source          => "puppet:///modules/sftpjail/sshd_config"
	}

	group { "sftpusers":
	        ensure => present,
	}

	file { "/sftp":
		ensure => "directory",
	}

}
