class snoopy::install () {
	package { ["syslog-ng", "snoopy"]:
            ensure => 'present'
        }
}
