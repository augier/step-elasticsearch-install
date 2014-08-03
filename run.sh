if [ ! -n "$WERCKER_ELASTICSEARCH_INSTALL_VERSION" ]; then
  error 'Please specify elasticsearch version'
  exit 1
fi

sudo wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
sudo add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main"
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
sudo apt-get install elasticsearch
sudo echo "network.bind_host: 127.0.0.1" >>  /etc/elasticsearch/elasticsearch.yml
sudo echo "script.disable_dynamic: true" >>  /etc/elasticsearch/elasticsearch.yml
sudo service elasticsearch restart