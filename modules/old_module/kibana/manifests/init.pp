class kibana {
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
       exec { "install_kibana":
        cwd      =>  "/opt",
       command   => "wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz;tar xvfz kibana-3.1.0.tar.gz",
       logoutput => true,
       timeout   => 1800,
        }
}
