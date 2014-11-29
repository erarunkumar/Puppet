
#Use this command to install jenkins
puppet module install rtyler-jenkins

#Install jenkins
include jenkins

#Install jenkins 
jenkins::plugin {
  "git" :
    version => "1.1.11";
}
