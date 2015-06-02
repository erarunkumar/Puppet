define sftpjail::user($name=undef,$password=undef) {

	user { $name: 
		password => "$password",
		managehome => true,
		ensure => present,
		home => "/incoming",
		groups => ['sftpusers'],
		shell => '/sbin/nologin'
	}

	file { ["/sftp/$name"]:
		ensure =>"directory",
	}

	file { ["/sftp/$name/incoming"]:
                ensure => "directory",
		owner => "$name",
		group => "sftpusers"
        }
		
}

