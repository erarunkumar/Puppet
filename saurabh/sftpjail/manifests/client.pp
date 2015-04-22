class sftpjail::client(
 $group_name = '',
 $user_name = '',
 $groups = [],
 $homedir = '',
 $u_pass = '',

){

                 include stdlib

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

                  group {"$group_name":
                         ensure => present, 
                        }

                  user {"${user_name}": 
                         # password => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${u_pass} | tr -d '\n'"),
                         groups => "$groups",
                         home => "$homedir",
                         #before => File['/sftp/${user_name}']
                       }
                 exec{"userpassword":
                         command => "bash -c  'echo -e \"$u_pass\n$u_pass\" | passwd $user_name'",
                         require => User[$user_name]
                      }

                 file_line {"config_file1":
                       path => "/etc/ssh/sshd_config",
                       ensure => present,
                       line => "Subsystem sftp internal-sftp",
                       match => "Subsystem sftp /usr/lib/openssh/sftp-server",
                      }
 
                 file_line {"config_file2":
                       path => "/etc/ssh/sshd_config",
                       ensure => present,
                       line => "Match Group $group_name
        ChrootDirectory /sftp/%u
        ForceCommand internal-sftp",
                      require => File_line['config_file1']
                      }  
                 
                  $mkdir =["/sftp/","/sftp/$user_name"]
                      
                 file{$mkdir:
                        ensure => directory,
                        recurse => true                        
                     }
                 
                 file{"userroot":
                         path => "/sftp/$user_name/incoming",
                         ensure => directory,
                         group => "$group_name",
                         owner => "$user_name"
                     }
                 
                 exec{"restartservice":
                     command => "service ssh restart",
                     }
}

