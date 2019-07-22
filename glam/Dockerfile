from httpd
RUN apt update
WORKDIR /opt/dv
RUN apt -y install git python3
RUN git clone https://github.com/QualitativeDataRepository/dataverse-previewers
RUN cp -R /opt/dv/dataverse-previewers/previewers /usr/local/apache2/htdocs/

