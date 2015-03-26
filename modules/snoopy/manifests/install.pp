class snoopy::install () {
	package { ["snoopy"]:
            ensure => 'present'
        }
}
