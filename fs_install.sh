#yum -y remove gcc-c++ cpp libgomp
yum -y install gcc gcc-c++ autoconf automake libtool ncurses-devel make zlib-devel libjpeg-devel unixODBC unixODBC-devel
yum -y install libmpg123-devel libshout-devel libshout lame-devel openssl-devel curl curl-devel pcre-devel speex-devel sqlite-devel ldns-devel libedit-devel yasm libcurl httpd lua-devel libsndfile-devel opus
-devel
rpm -ivh mysql-connector-odbc-5.3.4-1.el6.x86_64.rpm
tar -xvf /opt/fs/freeswitch-1.6.20.tar.xz -C /opt/fs/
sed -i 's/^#\(event_handlers\/mod_odbc_cdr\)/\1/' /opt/fs/freeswitch-1.6.20/modules.conf
sed -i 's/^#\(applications\/mod_curl\)/\1/' /opt/fs/freeswitch-1.6.20/modules.conf
sed -i 's/^#\(applications\/mod_http_cache\)/\1/' /opt/fs/freeswitch-1.6.20/modules.conf
sed -i 's/^#\(formats\/mod_shout\)/\1/' /opt/fs/freeswitch-1.6.20/modules.conf
sed -i 's/^#\(applications\/mod_distributor\)/\1/' /opt/fs/freeswitch-1.6.20/modules.conf
sed -i 's/^\(codecs\/mod_opus\)/#\1/' /opt/fs/freeswitch-1.6.20/modules.conf
cd /opt/fs/freeswitch-1.6.20 && ./configure
#cp /opt/fs/opus-1.1-p2.tar.gz /var/www/html/
#service httpd start 
#sed -i 's/files.freeswitch.org\/downloads\/libs/127.0.0.1/' /opt/fs/freeswitch-1.6.20/build/getlib.sh
cd /opt/fs/freeswitch-1.6.20 && make && make install
#service httpd stop
ln -sf /usr/local/freeswitch/bin/freeswitch /usr/bin/
ln -sf /usr/local/freeswitch/bin/fs_cli /usr/bin/
mkdir /usr/local/freeswitch/sounds
tar -xvf /opt/fs/freeswitch-sounds-music-8000-1.0.8.tar.gz -C /usr/local/freeswitch/sounds/
tar -xvf /opt/fs/freeswitch-sounds-en-us-callie-8000-1.0.22.tar.gz -C /usr/local/freeswitch/sounds/
cp -f /opt/fs/odbc.ini /etc/odbc.ini
cp -f /opt/fs/modules.conf.xml /usr/local/freeswitch/conf/autoload_configs/
cp -f /opt/fs/vars.xml /usr/local/freeswitch/conf/
#sed -i 's/<!-- <param name="core-db-dsn" value="dsn:username:password" \/> -->/<param name="core-db-dsn" value="odbc:\/\/freeswitch::" \/>/' /usr/local/freeswitch/conf/autoload_configs/switch.conf.xml
#cp /opt/fs/odbc_cdr.conf.xml /usr/local/freeswitch/conf/autoload_configs/
cp -f /opt/fs/freeswitch.service /lib/systemd/system/
cp -f /opt/fs/freeswitch /etc/sysconfig/
cd /usr/local/ && chown -R root:root freeswitch && chmod -R g+w freeswitch
systemctl enable freeswitch.service
#freeswitch
