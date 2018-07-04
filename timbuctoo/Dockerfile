from huygensing/timbuctoo:latest
RUN apk add --no-cache curl
COPY timbuctoo /app
COPY easy100.nt /app
COPY ElsstTriples2017-10-02-033936.nt /app
ENV timbuctoo_elasticsearch_host=http://elasticsearch
ENV timbuctoo_elasticsearch_port=80
ENV timbuctoo_elasticsearch_user=elastic
ENV timbuctoo_elasticsearch_password=changeme
ENV timbuctoo_search_url=http://elasticsearch:9200
ENV timbuctoo_indexer_url=http://elasticsearch:9200
