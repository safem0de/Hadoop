FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ADD start-datanode.sh /start-datanode.sh
RUN chmod +x /start-datanode.sh

EXPOSE 9864

CMD ["/start-datanode.sh"]