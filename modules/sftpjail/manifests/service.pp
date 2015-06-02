class sftpjail::service() {
	service { "sshd":
		ensure  => "running",
		enable  => "true",
		require => Package["openssh-server"],
	}

}
