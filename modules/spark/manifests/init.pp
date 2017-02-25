# == Class: spark
#
# Full description of class a here.
#
class spark (
  $spark_env = undef,
  $master_url = undef,
) {
  include spark::config
}
