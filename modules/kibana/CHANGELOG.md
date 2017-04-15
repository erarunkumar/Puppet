## 0.2.1 (April 10, 2017)

### Summary
Bugfix release resolving several minor issues.

#### Features
* Package revisions now supported for ensure values.

#### Fixes
* The `url` parameter for 4.x plugins is now properly passed to the plugin install command.
* Nonzero plugin commmands now properly raise errors during catalog runs.
* Boolean values allowed in config hash.
* apt-transport-https package no longer managed by this module.

## 0.2.0 (March 20, 2017)

### Summary
Minor fixes and full 4.x support.

#### Features
* Feature parity when managing plugins on Kibana 4.x.

#### Fixes
* Removed potential conflict with previously-defined apt-transport-https packages.
* Permit boolean values in configuration hashes.

## 0.1.1 (March 11, 2017)

### Summary
Small bugfix release.

#### Fixes
* Actually aknowledge and use the manage_repo class flag.

## 0.1.0 (March 8, 2017)

### Summary
Initial release.

#### Features
* Support for installing, removing, and updating Kibana and the Kibana service.
* Plugin support.
* Initial support for version 4.x management.

#### Fixes
