# == Class: roles::logstash
#
class roles::logstash {
  include profiles::java
  include profiles::logstash
}
