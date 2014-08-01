# Add GPG public key
wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

# Select Oracle jazz
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

# Seen Oracle Jazz
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

#add apt repositories
add-apt-repository deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main

