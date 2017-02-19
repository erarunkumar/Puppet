node 'master-spark' {
  class { 'aerospike':
    version       => '3.8.3',
    download_user => 'myuser',
    download_pass => 'mypassword',
    config_ns     => {
      'bar' => {
        'replication-factor' => 2,
        'memory-size'        => '10G',
        'default-ttl'        => '30d',
        'storage-engine'     => 'memory',
      },
      'foo' => {
        'replication-factor'    => 2,
        'memory-size'           => '500M',
        'default-ttl'           => 172800,
        'high-water-disk-pct'   => 90,
        'high-water-memory-pct' => 90,
        'set hahaha'            => [ 'set-disable-eviction true', ],
        'storage-engine device' => [
          'file /opt/foo1.dat',
          'file /opt/foo2.dat',
          'filesize 10G',
          'data-in-memory false',
          'write-block-size 128K',
          'scheduler-mode noop',
        ]
      },
    },
  }
}
