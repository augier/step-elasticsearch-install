if [ ! -n "$WERCKER_ELASTICSEARCH_INSTALL_VERSION" ]; then
  error 'Please specify elasticsearch version'
  exit 1
fi

sudo wget -O /tmp/elasticsearch-$WERCKER_ELASTICSEARCH_INSTALL_VERSION.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$WERCKER_ELASTICSEARCH_INSTALL_VERSION.deb
sudo dpkg -i /tmp/elasticsearch-$WERCKER_ELASTICSEARCH_INSTALL_VERSION.deb