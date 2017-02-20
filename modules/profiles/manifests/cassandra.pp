#
# == Class: class_name
#
class profiles::cassandra {
  include cassandra::datastax_repo
  include cassandra
}
