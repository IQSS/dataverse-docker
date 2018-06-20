# CentOS Base Image
from debian:stretch

# Package Update and install Postfix
RUN apt-get update && apt-get upgrade -y && apt-get install postfix rsyslog mailutils -y && apt-get clean -y

# Copy Postfix Configuration file and Entrypoint
## Postfix ##
COPY config/postfix/main.cf /etc/postfix/main.cf
COPY config/postfix/sasl_passwd /etc/postfix/sasl_passwd

## Rsyslog ##
COPY config/rsyslog/rsyslog.conf /etc/rsyslog/rsyslog.conf
COPY config/rsyslog/listen.conf /etc/rsyslog.d/listen.conf


# Change Permissions
RUN chmod 0400 /etc/postfix/sasl_passwd

# Generate SASL DB
RUN postmap /etc/postfix/sasl_passwd


# Expose SMTP
EXPOSE 25


# Entrypoint
CMD cp /etc/resolv.conf /var/spool/postfix/etc/resolv.conf && service rsyslog start && postfix start && tail -f /var/log/mail.log
