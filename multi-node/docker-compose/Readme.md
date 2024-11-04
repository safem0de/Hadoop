### Docker Compose
```bash
docker-compose up -d
```

### Namenode (web ui)
```bash
http://localhost:9870
```
### Datanode1 (web ui)
```bash
http://localhost:9864
```
### Datanode2 (web ui)
```bash
http://localhost:9865
```

### Apache Doc
```bash
https://hadoop.apache.org/docs/r3.2.1/hadoop-project-dist/hadoop-hdfs/HDFSCommands.html
```

### Docker volume
```bash
docker volume ls
```

### Start local
```bash
docker exec -it namenode /bin/bash
```

### Check OS details
```bash
cat /etc/os-release
```

### Check Local path
```bash
ls -al
```

### os update & install wget with check version
```bash
apt-get update
apt-get install wget -y
wget --version
```

### remove olds ources.list
```bash
rm /etc/apt/sources.list
```

### fixed apt update (create new sources.list)
```bash
echo "deb http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list
echo "deb http://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list
```

### Disable signature validation for the old release
```bash
echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99ignore-release-date
```

### Firewall allowed (no need)
```bash
docker exec -it namenode iptables -A INPUT -p tcp --dport 9870 -j ACCEPT
docker exec -it namenode iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
```

### Check the HDFS filesystem status
```bash
hdfs dfsadmin -report
```

### Check the HDFS environment variables
```bash
hdfs envvars
```

### Create a directory in hadoop
```bash
hdfs dfs -mkdir /user/root
```

### Check the directory
```bash
hdfs dfs -ls /user/root
```