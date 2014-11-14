# class "logstash" initialize installation of all components needed to run logstash 

class logstash {

  include logstash::install
  include logstash::service
  include logstash::conf
}
