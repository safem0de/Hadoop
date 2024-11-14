# Docker Ubuntu Desktop

### build ubintu desktop
```bash
docker build -t ubuntu-desktop-24.10 .
```

### run container
```bash
docker run -d -p 5901:5901 --name my-ubuntu-desktop ubuntu-desktop-24.10
```

### access ubuntu via cli
```bash
docker exec -it my-ubuntu-desktop /bin/bash
```

### installed list start with t
```bash
apt list --installed | grep ^t
```

ในการแตกไฟล์ .tar.gz (หรือ .tgz) บน Ubuntu หรือ Linux distribution ใด ๆ คุณสามารถใช้คำสั่ง tar ได้ โดยไม่จำเป็นต้องใช้ unzip เนื่องจาก tar รองรับการจัดการไฟล์บีบอัดประเภทนี้โดยตรงใช้คำสั่งนี้:

```bash
tar -xzvf filename.tar.gz
```
คำอธิบาย:
* x: Extract files (แตกไฟล์)
* z: ใช้ gzip เพื่อจัดการกับไฟล์ .gz
* v: Verbose (แสดงรายการไฟล์ที่ถูกแตกออกมา)
* f: ระบุชื่อไฟล์ที่ต้องการแตก

