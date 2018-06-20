FROM fedora:25

RUN dnf install certbot -y && dnf install procps -y && dnf install curl -y  && dnf install wget -y && dnf install which -y && dnf clean all

RUN mkdir /etc/letsencrypt

COPY google-cloud-sdk.repo /etc/yum.repos.d/google-cloud-sdk.repo
RUN dnf install -y google-cloud-sdk

COPY kubernetes.repo /etc/yum.repos.d/kubernetes.repo
RUN dnf install -y kubectl


COPY secret-patch-template.json /
COPY entrypoint.sh /


EXPOSE 80 443

VOLUME ["/etc/letsencrypt"]

CMD ["/entrypoint.sh"]