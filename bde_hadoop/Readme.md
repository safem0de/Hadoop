```bash
mkdir base
mkdir namenode
mkdir datanode
mkdir nodemanager
mkdir resourcemanager
mkdir historyserver
```
~~mkdir nginx~~
~~mkdir submit~~

type nul > hadoop.env
# 1
```bash
type nul > base/Dockerfile
type nul > base/entrypoint.sh
```
# 2
```bash
type nul > datanode/Dockerfile
type nul > datanode/start-datanode.sh
```
# 3
```bash
type nul > namenode/Dockerfile
type nul > namenode/start-namenode.sh
```
# 4
```bash
type nul > nodemanager/Dockerfile
type nul > nodemanager/start-nodemanager.sh
```
# 5
```bash
type nul > resourcemanager/Dockerfile
type nul > resourcemanager/start-resourcemanager.sh
```
# 6
```bash
type nul > historyserver/Dockerfile
type nul > historyserver/start-resourcemanager.sh
```