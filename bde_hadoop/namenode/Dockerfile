FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD start-namenode.sh /start-namenode.sh
RUN chmod a+x /start-namenode.sh

EXPOSE 9870

CMD ["/start-namenode.sh"]