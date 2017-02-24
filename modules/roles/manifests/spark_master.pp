#
class roles::spark_master {
  class { 'profiles::java': }->
  class { 'profiles::spark_master': }
}
