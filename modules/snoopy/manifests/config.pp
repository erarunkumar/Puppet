class snoopy::config () {
	Exec {
		require => Class["snoopy::install"]
	}

	exec { "snoopy_add_preload":
		command => "/bin/echo '/lib64/snoopy.so' >> /etc/ld.so.preload",
		unless  => "/bin/grep snoopy /etc/ld.so.preload"
        }

	file { "/etc/syslog-ng/snoopy.conf":
		content => template('snoopy/snoopy.conf.erb'),
	}

	file_line { "/etc/syslog-ng/syslog-ng.conf":
		ensure => present,
		line => '@include "snoopy.conf"',
		path => '/etc/syslog-ng/syslog-ng.conf',
 	} 

}

