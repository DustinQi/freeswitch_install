## freeswitch_install
freeswitch安装脚本 用于在linux上自动部署freeswitch（centOS 7上已验证）

### 材料清单（解压fs.tar）

#### 安装脚本
fs_install.sh 
#### fs源码
freeswitch-1.6.20.tar.xz
#### fs基础声音文件
freeswitch-sounds-en-us-callie-8000-1.0.22.tar.gz
freeswitch-sounds-music-8000-1.0.8.tar.gz
#### mysql connector(习惯了使用mysql)
mysql-connector-odbc-5.3.4-1.el6.x86_64.rpm 
#### 编码器
opus-1.1-p2.tar.gz
#### 其他配置文件（具体作用看fs_install.sh内容）
modules.conf.xml(fs内部配置文件，配置默认安装模块)
odbc_cdr.conf.xml(fs内部配置文件，话单输出配置)
vars.xml(fs内部配置文件，全局变量配置)
odbc.ini(配置db引擎)
freeswitch(最终会放在/etc/sysconfig/下)
freeswitch(fs服务，最终会放在/lib/systemd/system/下)
