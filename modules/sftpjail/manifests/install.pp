class sftpjail::install() {
	package{"openssh-server":
		ensure => present
	}
}
