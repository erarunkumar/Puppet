class snoopy::service () {
        service { 'syslog-ng':
                ensure => running,
                require => File_line['/etc/syslog-ng/syslog-ng.conf'],
        }

        exec { "logger-restart":
            command     => "/etc/init.d/$logger restart",
            subscribe   => File_line["/etc/syslog-ng/syslog-ng.conf"],
            refreshonly => true,
        }
}
