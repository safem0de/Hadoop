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

/opt/hive/conf/hive-site.xml

$HIVE_HOME/bin/hive --service hiveserver2 &
