https://www.tutorialspoint.com/hive/hive_installation.htm

### Running the Setup
Place all the configuration files (core-site.xml, hdfs-site.xml, mapred-site.xml, yarn-site.xml, hive-site.xml) in the same directory as your Dockerfile.
Run the following command to build the Docker images and start the containers:

```bash
docker-compose up --build
```
### Access the Hadoop and Hive services:

HDFS Web UI: http://localhost:9870
YARN Resource Manager UI: http://localhost:8088
Hive Thrift Server: Port 10000 (used for JDBC connections)
Testing the Hadoop Cluster
Enter the master container:

```bash
docker exec -it hadoop-master bash
```

### Create an HDFS directory:
```bash
hdfs dfs -mkdir -p /user/hadoop
```
### Start the Hive Metastore and Thrift server (if not started by default):

```bash
$HIVE_HOME/bin/hive --service metastore &
$HIVE_HOME/bin/hive --service hiveserver2
```

This setup will give you a functional Hadoop cluster with Hive running on a multi-node Docker environment! 🐳

### Clear Build Cache in Docker Compose
If you are building with docker-compose and want to rebuild without using the cache, use:

```bash
docker-compose build --no-cache
```

```bash
docker exec -it hadoop-worker1 jps
docker exec -it hadoop-worker2 jps
```

Configure slaves or workers File in Hadoop:

Hadoop needs to know which nodes are part of the cluster. Check if the slaves (or workers in recent Hadoop versions) file is configured correctly.
On the hadoop-master node, check the file located at $HADOOP_HOME/etc/hadoop/slaves (or $HADOOP_HOME/etc/hadoop/workers if applicable). This file should list the hostnames of your worker nodes:

```bash
worker1
worker2
```

If this file doesn’t list worker1 and worker2, add them and restart the cluster.
Network Configuration and Hostname Resolution:

Ensure that hadoop-master can resolve worker1 and worker2 by hostname. Check /etc/hosts inside the hadoop-master container to confirm.
You can add the following entries to each node's /etc/hosts file if they are missing:
```bash
127.0.0.1       localhost
<worker1_ip>    worker1
<worker2_ip>    worker2
```
Docker Compose usually manages this, but you can add it manually if needed for debugging.

```bash
/opt/hive/conf/hive-site.xml
```

```bash
root@master:/# hive version
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hive/lib/log4j-slf4j-impl-2.18.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/hadoop/share/hadoop/common/lib/slf4j-reload4j-1.7.36.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
Beeline version 4.0.1 by Apache Hive
beeline> 
```

### ตัวอย่างการลบ slf4j-reload4j
```bash
rm /opt/hadoop/share/hadoop/common/lib/slf4j-reload4j-1.7.36.jar
```

### add connection for hive 
```bash
!connect jdbc:hive2://localhost:10000/default --verbose=true
```

วิธีที่ 1: ใช้คำสั่ง netstat
```bash
sudo netstat -tuln
```
* t แสดงเฉพาะการเชื่อมต่อ TCP
* u แสดงเฉพาะการเชื่อมต่อ UDP
* l แสดงเฉพาะพอร์ตที่กำลังฟังอยู่ (Listening)
* n แสดงหมายเลขพอร์ตในรูปแบบตัวเลข (ไม่แปลงเป็นชื่อ)


|Proto | Recv-Q | Send-Q | Local Address | Foreign Address| State | PID/Program name |
|:-----|:-------|:-------|:--------------|:---------------|:------|:-----------------|
|tcp   |     0  |        | 0 0.0.0.0:22  |  0.0.0.0:*     |LISTEN | 1348/sshd        |
|tcp6  |     0  |        | 0 :::8080     |  :::*          |LISTEN | 912/java         |
|tcp6  |     0  |        | 0 :::10000    |  :::*          |LISTEN | 1410/hiveserver2 |

นี่จะแสดงรายการพอร์ตที่กำลังฟังอยู่และโปรแกรมที่กำลังใช้พอร์ตนั้น

