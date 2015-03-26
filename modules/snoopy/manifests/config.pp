class snoopy::config () {
	Exec {
		require => Class["snoopy::install"]
	}

	exec { "snoopy_add_preload":
		command => "/bin/echo '/lib64/snoopy.so' >> /etc/ld.so.preload",
		unless  => "/bin/grep snoopy /etc/ld.so.preload"
        }
}

