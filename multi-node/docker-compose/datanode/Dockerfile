# Dockerfile for NameNode
FROM bde2020/hadoop-namenode:2.0.0-hadoop3.2.1-java8

# ติดตั้ง wget
RUN apt-get update && apt-get install -y wget iptables

# ทำความสะอาดไฟล์ที่ไม่จำเป็นหลังการติดตั้ง
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
