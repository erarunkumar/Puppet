# == Class: ulimit::rules
#
class ulimit::rules(
  $limit_config = {}
) {
  create_resources('ulimit::rule', $limit_config)
}
