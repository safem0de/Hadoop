FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD start-nodemanager.sh /start-nodemanager.sh
RUN chmod a+x /start-nodemanager.sh

EXPOSE 8042

CMD ["/start-nodemanager.sh"]