#
class cdh_repo {
  file { '/etc/yum.repos.d/cloudera-cdh5.repo':
    source => 'puppet:///modules/cdh_repo/cloudera-cdh5.repo',
    owner  => root,
    group  => root,
    mode   => '0644',
  }
}
