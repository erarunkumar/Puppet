#
class roles::aerospike {
  class { 'profiles::base': }->
  class { 'profiles::aerospike': }
}
