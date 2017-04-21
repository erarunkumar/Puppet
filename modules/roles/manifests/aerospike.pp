#
class roles::aerospike {
  class { 'profiles::aerospike': }->
  class { 'profiles::base': }->
  class { 'profiles::aerospike': }
}
