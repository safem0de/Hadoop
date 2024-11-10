#!/bin/bash

# ตั้งค่าเชื่อมต่อกับ Namenode ในกรณีที่มี multi-node
export CORE_CONF_fs_defaultFS=${CORE_CONF_fs_defaultFS:-hdfs://namenode:8020}
export HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data

# กำหนดตัวแปร datadir ให้เป็นพาธไดเรกทอรีข้อมูลของ Datanode
datadir=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`

# ตรวจสอบว่ามีไดเรกทอรีข้อมูลของ Datanode อยู่หรือไม่
if [ ! -d $datadir ]; then
  echo "Datanode data directory not found: $datadir"
  exit 2
fi

# รอให้ Namenode พร้อมทำงานก่อนเริ่มต้น Datanode
function wait_for_namenode() {
    echo "Waiting for Namenode to be ready..."
    until curl -s http://namenode:9870/ | grep -q "This is Namenode"; do
        echo "Waiting for Namenode..."
        sleep 5
    done
    echo "Namenode is ready!"
}

# เรียกฟังก์ชันรอ Namenode
wait_for_namenode

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR datanode

# ทำให้ container รันต่อไปโดยไม่หยุด (น่ากลัว Comment ไว้ก่อน)
# tail -f /dev/null