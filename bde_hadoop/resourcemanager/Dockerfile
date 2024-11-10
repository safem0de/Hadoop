FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD start-resourcemanager.sh /start-resourcemanager.sh
RUN chmod a+x /start-resourcemanager.sh

EXPOSE 8088

CMD ["/start-resourcemanager.sh"]