class snoopy (
    $logger     = "syslog-ng",
    $logfile    = "/var/log/snoopy.log",
    ) {
	package { "syslog-ng":
            ensure => 'present'
        }
        package { "snoopy":
            ensure => 'installed'
        }
        Exec {
            require => Package['snoopy']
        }
        exec { "snoopy_add_preload":
            command     => "/bin/echo '/lib64/snoopy.so' >> /etc/ld.so.preload",
            unless      => "/bin/grep snoopy /etc/ld.so.preload"
        }
        file { "/etc/logrotate.d/snoopy":
            content => template('snoopy/logrotate.conf.erb'),
        }
        # Process logging
        if $logger == 'syslog-ng' {
            file { "/etc/syslog-ng/conf.d/snoopy.conf":
                content => template('snoopy/syslog-ng.conf.erb'),
                alias   => "logger",
            }
        }
        exec { "logger-restart":
            command     => "/etc/init.d/$logger restart",
            subscribe   => File["logger"],
            refreshonly => true,
        }
}
