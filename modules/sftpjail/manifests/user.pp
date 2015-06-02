define sftpjail::user($name=undef,$password=undef,$udt=undef,$authorized_keys=undef) {
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

if $udt {
	user { $name: 
		password => "$password",
		managehome => true,
		ensure => present,
		home   => "/incoming",
		groups => ['sftpusers'],
	}
	file { ["/sftp/$name"]:
                ensure =>"directory",
        }

        file { ["/sftp/$name/incoming"]:
                ensure => "directory",
                owner  => "$name",
                group  => "sftpusers"
        }
	}
else{
	user {$name:
                managehome => true,
                ensure => present,
                home   => "/incoming",
                groups => ['sftpusers'],
        }

	exec{"authorized_keys":
		command => "bash -c 'echo $authorized_keys >> /etc/ssh-pool/$name.pub'",
		require => File['/etc/ssh-pool']
	}
        file { ["/sftp/$name"]:
                ensure =>"directory",
        }

        file { ["/sftp/$name/incoming"]:
                ensure => "directory",
                owner  => "$name",
                group  => "sftpusers"
        }
        file { ["/etc/ssh-pool"]:
                ensure => "directory",
                owner  => "$name",
                group  => "sftpusers",
	}
}
}
