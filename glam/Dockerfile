from httpd
RUN apt update
WORKDIR /opt/dv
RUN apt -y install git python3
RUN git clone https://github.com/QualitativeDataRepository/dataverse-previewers
RUN cp -R /opt/dv/dataverse-previewers/previewers /usr/local/apache2/htdocs/
RUN cp -R /opt/dv/dataverse-previewers /usr/local/apache2/htdocs/
RUN git clone https://github.com/scholarsportal/Dataverse-Data-Explorer.git
RUN cp -R /opt/dv/Dataverse-Data-Explorer /usr/local/apache2/htdocs/
