#
define nvm_nodejs::installpackages {
  exec { $name:
    command     => "/bin/bash -c \"source  ${nvm_nodejs::app_home}/.nvm/nvm.sh && npm install -g ${name}\"",
    user        => $nvm_nodejs::app_user,
    cwd         => $nvm_nodejs::app_home,
    creates     => "${nvm_nodejs::app_home}/.nvm/versions/v${nvm_nodejs::version}/bin/${name}",
    environment => [ "HOME=${nvm_nodejs::app_home}", "NVM_DIR=${nvm_nodejs::app_home}/.nvm" ]
  }
}
