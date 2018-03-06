from postgres:9.3
COPY pg_hba.conf /tmp
ENV HOST_DNS_ADDRESS "localhost"
ENV POSTGRES_DB "dvndb"
ENV POSTGRES_USER "dvnapp"

RUN cp /tmp/pg_hba.conf /var/lib/postgresql/data/ 
RUN apt-get update
RUN apt-get install -y unzip sudo
RUN sudo -u postgres /usr/lib/postgresql/9.3/bin/initdb -D /var/lib/postgresql/data
COPY pg_hba.conf /etc/postgresql/9.3/data/pg_hba.conf
RUN sudo -u postgres /usr/lib/postgresql/9.3/bin/pg_ctl  -D /var/lib/postgresql/data start

#RUN pg_createcluster 9.3 data --start
#RUN sudo -u postgres /usr/lib/postgresql/9.3/bin/postgres -C /etc/postgresql/9.3/data/postgresql.conf -D /var/lib/postgresql/9.3
RUN sudo /etc/init.d/postgresql start

COPY testdata /opt
COPY init-postgres /opt
COPY dvinstall.zip /opt
WORKDIR /opt
RUN unzip dvinstall.zip
WORKDIR /opt/dvinstall
#RUN /opt/init-postgres
#RUN sleep 10
#RUN sudo -u postgres /usr/lib/postgresql/9.3/bin/createuser dvnapp
