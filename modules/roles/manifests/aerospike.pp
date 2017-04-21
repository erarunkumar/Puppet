#
class roles::aerospike {
  class { 'profiles::fstab': }->
  class { 'profiles::base': }->
  class { 'profiles::aerospike': }
}
