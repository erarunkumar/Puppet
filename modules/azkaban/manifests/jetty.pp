class azkaban::jetty($password=password){

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

	exec{"keystore":
		command =>"bash -c 'echo -e \"$password\npassword\n\n\n\n\n\n\nyes\n$password\n$password\n\" | keytool -keystore keystore -alias jetty -genkey -keyalg RSA'",
		cwd     =>  '/opt/',
		creates => '/opt/keystore',
}

	exec{"jettycert":
		command =>"bash -c 'echo -e \"$password\"| keytool -certreq -alias jetty -keystore keystore -file jetty.csr'",
		cwd     =>  '/opt/',
		creates => '/opt/jetty.csr',
		require => Exec['keystore'],
}
}

