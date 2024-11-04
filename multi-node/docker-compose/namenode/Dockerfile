# Dockerfile for NameNode with SSH
FROM bde2020/hadoop-namenode:2.0.0-hadoop3.2.1-java8

# ติดตั้ง OpenSSH server และ wget
RUN apt-get update && apt-get install -y wget openssh-server iptables

# สร้างไดเรกทอรีสำหรับ SSH
RUN mkdir /var/run/sshd

# กำหนดรหัสผ่านให้กับ root (คุณควรเปลี่ยนรหัสนี้)
RUN echo 'root:rootpassword' | chpasswd

# อนุญาตการเชื่อมต่อ SSH ผ่าน root
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# ปรับแต่ง SSH config เพื่อไม่ปิดการเชื่อมต่อ
RUN echo 'ClientAliveInterval 60' >> /etc/ssh/sshd_config

# เปิดใช้งาน SSH service
EXPOSE 22

# เริ่ม SSH เมื่อ container เริ่มทำงาน
CMD ["/usr/sbin/sshd", "-D"]
