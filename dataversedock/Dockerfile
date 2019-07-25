FROM centos:7.2.1511
# OS dependencies
RUN yum install -y java-1.8.0-openjdk-headless sudo epel-release unzip perl curl
RUN yum install -y wget patch postgresql lynx jq R-core R-core-devel

RUN echo "Installing R libraries..."
RUN /usr/bin/Rscript --slave --no-save --no-restore-history -e "install.packages('R2HTML', repos=c('http://cran.us.r-project.org', lib='/usr/lib64/R/library'))" && \
    /usr/bin/Rscript --slave --no-save --no-restore-history -e "install.packages('rjson', repos=c('http://cran.us.r-project.org', lib='/usr/lib64/R/library'))" && \
    /usr/bin/Rscript --slave --no-save --no-restore-history -e "install.packages('DescTools', repos=c('http://cran.us.r-project.org', lib='/usr/lib64/R/library'))" && \
    /usr/bin/Rscript --slave --no-save --no-restore-history -e "install.packages('Rserve', repos=c('http://cran.us.r-project.org', lib='/usr/lib64/R/library'))" && \
    /usr/bin/Rscript --slave --no-save --no-restore-history -e "install.packages('haven', repos=c('http://cran.us.r-project.org', lib='/usr/lib64/R/library'))"

COPY dv/rserve/Rserv.pwd /etc
COPY dv/rserve/Rserv.conf /etc
RUN groupadd -g 97 rserve && \
    useradd -g rserve -u 97 -s /bin/bash rserve && \
    chmod 0664 /etc/Rserv.conf && \
    chmod 0600 /etc/Rserv.pwd && \
    mkdir -p /var/run/rserve && \
    chmod -R 777 /var/run/rserve

# copy and unpack dependencies (solr, glassfish)
COPY lang.properties /opt/dv
COPY lang.templates /opt/dv
WORKDIR /opt/dv
COPY dv /opt/dv

#COPY dv/deps/glassfish4 /opt/glassfish4
COPY dv/deps/glassfish-4.1.zip /opt/
RUN unzip /opt/glassfish-4.1.zip -d /opt
RUN rm /opt/glassfish4/glassfish/modules/weld-osgi-bundle.jar
COPY dv/deps/weld-osgi-bundle.jar /opt/glassfish4/glassfish/modules/weld-osgi-bundle.jar
COPY cv /opt/dv 

# glassfish port
EXPOSE 8080
VOLUME /opt/glassfish4/glassfish/domains/domain1/docroot

COPY dv/deps/dvinstall.zip /opt/dv
COPY dv/deps/dataverse.war /opt/dv
COPY docker.patch /opt/dv
COPY dataverse-property-files /opt/dv/dataverse-property-files

# yeah - still not happy if glassfish isn't in /usr/local :<
RUN ln -s /opt/glassfish4 /usr/local/glassfish4
#COPY langswitch.sh /opt/dv
#COPY dv/install/ /opt/dv/
COPY previewers.sh /opt/dv
COPY install.bash /opt/dv/
COPY entrypoint.bash /opt
COPY testdata /opt/dv/testdata
COPY testscripts/* /opt/dv/testdata/
COPY setupIT.bash /opt/dv
RUN echo "Installing and running Dataverse..."
CMD ["/opt/entrypoint.bash"]
