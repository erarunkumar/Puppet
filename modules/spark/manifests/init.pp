# == Class: spark
#
# Full description of class a here.
#
class spark (
  $spark_env = undef,
  $slave = undef,
) {
  include spark::params
  include spark::config

  if $::slave != undef {
    file { "${::confdir}/slaves":
      content => template('spark/slaves.erb'),
      mode    => '0644',
      owner   => 'spark',
      group   => 'spark',
    }
  }

  if $::spark_env != undef {
    file { "${::confdir}/spark-env.sh":
      content => template('spark/spark-env.sh.erb'),
      mode    => '0755',
      owner   => 'spark',
      group   => 'spark',
    }
  }

  file { '/etc/profile.d/spark.sh':
    source => 'puppet:///modules/spark/profile.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
