# base/Dockerfile
FROM debian:9

# ติดตั้งแพ็กเกจที่จำเป็น
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
      libsnappy-dev \
      openssh-server \
      procps \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV HADOOP_VERSION=3.2.1
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV PATH $HADOOP_HOME/bin/:$PATH

# ดาวน์โหลดและติดตั้ง Hadoop
RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS \
    && gpg --import KEYS \
    && curl -fSL "https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" -o /tmp/hadoop.tar.gz \
    && curl -fSL "https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
    && mkdir /opt/hadoop-$HADOOP_VERSION/logs \
    && mkdir /hadoop-data

# ติดตั้ง Hive
ENV HIVE_VERSION=3.1.2
ENV HIVE_HOME=/opt/hive-$HIVE_VERSION
ENV PATH $HIVE_HOME/bin/:$PATH

RUN curl -fSL "https://www.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz" -o /tmp/hive.tar.gz \
    && tar -xvf /tmp/hive.tar.gz -C /opt/ \
    && mv /opt/apache-hive-$HIVE_VERSION-bin $HIVE_HOME \
    && rm /tmp/hive.tar.gz

# ตั้งค่า SSH
RUN mkdir /var/run/sshd \
    && echo 'root:hadoop' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# เพิ่ม entrypoint script
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# เปิดพอร์ตสำหรับ SSH
EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]