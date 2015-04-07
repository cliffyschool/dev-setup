wget --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn/linux/instantclient/121020/instantclient-basic-linux.x64-12.1.0.2.0.zip" \
  -O /tmp/instantClient-basic-12.1.0.2.0.zip 
unzip /tmp/instantClient.zip 

wget --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn/linux/instantclient/121020/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip" \
  -O /tmp/instantClient-sqlplus-12.1.0.2.0.zip 
unzip /tmp/instantClientSqlplus.zip

sudo mv -r /instantClient_12_1 /usr/local/instantClient
sudo ln -s /usr/local/instantClient/sqlplus /usr/sbin/sqlplus
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/instantClient/"


