ARG VERSION

FROM postgres:$VERSION

COPY ansible/ /tmp/ansible/

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt install -y ansible sudo git && \
    apt -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade && \
    cd /tmp/ansible && \
    ansible-playbook playbook-docker.yml && \
    apt -y remove libaom0 && \
    apt -y autoremove && \
    apt -y autoclean && \
#    apt install -y default-jdk-headless && \
    apt install -y locales && \
    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
