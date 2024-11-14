FROM ubuntu:24.10

# ติดตั้ง desktop environment และ VNC server
RUN apt update && \
    apt install -y xfce4 xfce4-goodies tightvncserver nano dbus-x11 sudo wget && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# ตั้งรหัสผ่านสำหรับผู้ใช้ root
RUN echo "root:rootp@ssw0rd" | chpasswd

# สร้างผู้ใช้ใหม่ที่มีสิทธิ์ sudo
RUN useradd -m -s /bin/bash admin && echo "admin:adminp@ssw0rd" | chpasswd && adduser admin sudo

# ตั้งค่า VNC Server สำหรับผู้ใช้ใหม่
RUN mkdir -p /home/admin/.vnc && \
    echo "vncp@ssw0rd" | vncpasswd -f > /home/admin/.vnc/passwd && \
    chmod 600 /home/admin/.vnc/passwd && \
    chown -R admin:admin /home/admin/.vnc

# สร้างไฟล์ .Xresources และตั้งค่า xstartup สำหรับผู้ใช้ใหม่
RUN touch /home/admin/.Xresources && \
    echo '#!/bin/sh\n\
unset SESSION_MANAGER\n\
unset DBUS_SESSION_BUS_ADDRESS\n\
xrdb $HOME/.Xresources\n\
xsetroot -solid grey\n\
startxfce4 &\n' > /home/admin/.vnc/xstartup && \
    chmod +x /home/admin/.vnc/xstartup && \
    chown -R admin:admin /home/admin

# กำหนดตัวแปร USER เป็น admin
ENV USER=admin

# เปลี่ยนผู้ใช้เป็น admin
USER admin
WORKDIR /home/admin

# กำหนด entrypoint สำหรับ VNC server
CMD ["sh", "-c", "vncserver :1 -geometry 1280x720 -depth 24 && tail -f /dev/null"]
