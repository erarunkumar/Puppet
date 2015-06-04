class azkaban::mysqluser{
class { 'mysql::server':
  root_password => 'password'
}

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

exec{"sqlfiles":
command =>'wget -P /opt/ https://s3.amazonaws.com/azkaban2/azkaban2/2.5.0/azkaban-sql-script-2.5.0.tar.gz',
creates => '/opt/azkaban-sql-script-2.5.0.tar.gz',
}

exec{"tarsqlfiles":
command =>'tar -xvzf /opt/azkaban-sql-script-2.5.0.tar.gz -C /opt/',
creates => '/opt/azkaban-2.5.0',
require => Exec['sqlfiles'],
}


mysql::db { 'azkaban':
  user     => 'rootazkaban',
  password => 'password',
  host     => 'localhost',
  sql      => '/opt/azkaban-2.5.0/create-all-sql-2.5.0.sql',
  import_timeout => 900,
  require       => [Class['mysql::server'],Exec['tarsqlfiles']],
before =>  Mysql_user['azkaban@localhost'],
}

mysql_user{ 'azkaban@localhost':
  ensure        => present,
  password_hash => mysql_password('azkaban'),
  require       => Class['mysql::server'],
}

mysql_grant{'azkaban@localhost/azkaban.*':
  user       => 'azkaban@localhost',
  table      => 'azkaban.*',
  privileges => ['UPDATE','SELECT','INSERT','DELETE'],
  require    => Mysql_user['azkaban@localhost'],
}


}
