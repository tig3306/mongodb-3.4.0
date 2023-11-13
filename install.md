# mongodb数据库部署说明

### 用途说明
聊天数据库

### 上传目录
/opt/mongodb-3.4.0/

### 创建目录
``` bash
mkdir -p /data/mongodb
cd /opt/mongodb-3.4.0/
mkdir logs
```

### 修改配置(可跳过,默认已修改为以下)
``` bash
vi /opt/mongodb-3.4.0/mongo.conf
```
``` conf
systemLog:
   destination: file
   path: "/opt/mongodb-3.4.0/logs/mongodb.log"
   logAppend: true
storage:
   dbPath: "/data/mongodb"
   journal:
      enabled: true
   mmapv1:
     smallFiles: true
   wiredTiger:
      engineConfig:
        configString: cache_size=1G
processManagement:
      fork: true
net:
   # 绑定本机访问, 如果需要其他机器访问, 注释掉
   bindIp: 127.0.0.1
   port: 27017
setParameter:
   enableLocalhostAuthBypass: false

# 开启帐号密码验证(如果不需要密码访问,注释这里)
# security:
#   authorization: enabled

```

### 启动mongodb
``` bash
./start.sh
```

### 停止mongodb
``` bash
./stop.sh
```

### 重启mongodb
``` bash
./restart.sh
```
