from httpd
RUN apt update
WORKDIR /opt/dv
RUN apt -y install git python3
RUN git clone https://github.com/QualitativeDataRepository/dataverse.git
RUN cp -R /opt/dv/dataverse/src/main/webapp/resources /usr/local/apache2/htdocs/

