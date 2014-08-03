if [ ! -n "$WERCKER_ELASTICSEARCH_INSTALL_VERSION" ]; then
  error 'Please specify elasticsearch version'
  exit 1
fi

sudo apt-get openjdk-7-jre-headless
sudo wget -O /tmp/elasticsearch-$WERCKER_ELASTICSEARCH_INSTALL_VERSION.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$WERCKER_ELASTICSEARCH_INSTALL_VERSION.deb
sudo dpkg -i /tmp/elasticsearch-$WERCKER_ELASTICSEARCH_INSTALL_VERSION.deb
sudo sed -i 's/# http.enabled: false/http.enabled: true/g' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/# network.host: 192.168.0.1/network.host: $$HOST$$/g' /etc/elasticsearch/elasticsearch.yml
sudo service elasticsearch restart