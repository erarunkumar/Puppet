class logs{
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
       exec { "install_logstash":
        cwd      =>  "/opt",
       command   => "wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz;tar zxvf logstash-1.4.2.tar.gz;mv logstash-1.4.2 server",
       logoutput => true,
       timeout   => 1800,
        }

         file {"/etc/conf.d/input_syslog.conf":
        ensure => ['directory', 'present'],
        source => "/etc/puppet/modules/logs/manifests/input_syslog.conf",
        owner  => 'root',
        group  => 'root',
        mode   => '640',
       }

         file {"/etc/conf.d/output_elasticsearch.conf":
        ensure => ['directory', 'present'],
        source => "/etc/puppet/modules/logs/manifests/output_elasticsearch.conf",
        owner  => 'root',
        group  => 'root',
        mode   => '640',
       }
         file {"/etc/conf.d/output_stdout.conf":
        ensure => ['directory', 'present'],
        source => "/etc/puppet/modules/logs/manifests/output_stdout.conf",
        owner  => 'root',
        group  => 'root',
        mode   => '640',
       }
         file {"/etc/init/logstash_server.conf":
        ensure => ['directory', 'present'],
        source => "/etc/puppet/modules/logs/manifests/logstash_server.conf",
        owner  => 'root',
        group  => 'root',
        mode   => '640',
       }
}

