# == Class: spark
#
# Full description of class a here.
#
class spark (
  $spark_env  = undef,
  $master_url = undef,
  $slave      = undef
) {
  include spark::config
}
