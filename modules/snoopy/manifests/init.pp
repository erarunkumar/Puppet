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
            file { "/etc/syslog-ng/snoopy.conf":
                content => template('snoopy/snoopy.conf.erb'),
		require => Package['snoopy'],
                alias   => "logger",
            }
	 file_line { "/etc/syslog-ng/syslog-ng.conf":
                ensure => present,
                line => '@include "snoopy.conf"',
                path   => '/etc/syslog-ng/syslog-ng.conf',
                require => File['/etc/syslog-ng/snoopy.conf'],
            }
        }
        service { 'syslog-ng':
                ensure => running,
                 require => File['/etc/syslog-ng/syslog-ng.conf'],
        }
        exec { "logger-restart":
            command     => "/etc/init.d/$logger restart",
            subscribe   => File["logger"],
            refreshonly => true,
        }
}
