FROM openjdk:8-jdk-alpine
RUN apk update
RUN apk add bash
RUN apk add curl
RUN mkdir /usr/local/bridge 
ENV MAPPING https://raw.githubusercontent.com/Dans-labs/bridge-mappings/master/src/main/resources/xsl/dara/dataverseJson-to-DaraXml.xsl
COPY bin /usr/local/bridge/bin
VOLUME /tmp
ARG APP_BASE_DIR=/usr/local/bridge
ARG APP_PROP
ARG APP_LIB
ARG JAR_FILE
#RUN mkdir -p ${APP_BASE_DIR}/bin && cd ${APP_BASE_DIR} && mkdir config bin/lib
#COPY ${JAR_FILE} ${APP_BASE_DIR}/bin/bridge-service.jar
#COPY ${APP_LIB} ${APP_BASE_DIR}/bin/lib
#COPY ${APP_PROP} ${APP_BASE_DIR}/config

#CMD ["/bin/bash"]
WORKDIR /usr/local/bridge/bin
ENTRYPOINT [ "sh", "-c", "java -Dspring.profiles.active=docker -Djava.security.egd=file:/dev/./urandom -jar ./bridge-service.jar" ]
