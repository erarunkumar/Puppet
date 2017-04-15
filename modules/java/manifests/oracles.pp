# Class java::oracles
# Wrapper class for java::oracles
#

class java::oracles (
    $java_details = {},
) {
  create_resources('java::oracle', $java_details)
}
