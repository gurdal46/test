#!/bin/bash
proxylogin=`head -4 /root/veriler.list | tail -1`
proxylogin="${proxylogin//[[:space:]]/}"
proxypass=`head -5 /root/veriler.list | tail -1`
proxypass="${proxypass//[[:space:]]/}"
sunucuip=`head -8 /root/veriler.list | tail -1`
sunucuip="${sunucuip//[[:space:]]/}"
echo daemon
echo nserver 8.8.4.4
echo nserver 8.8.8.8
echo nscache 65536
echo timeouts 1 5 30 60 180 1800 15 60
if [[ "$proxylogin" != 0 ]]
  then
echo users $proxylogin:CL:$proxypass
echo auth strong
echo authcache $proxylogin 60
echo auth cache strong
echo allow $proxylogin
nopass=""
else
nopass="-u"
fi

echo flush



port=$(awk 'NR==6' </root/veriler.list )

port="$(( 10#${port/[^0-9]} + 0 ))"

count=1
for i in $(cat /root/ip.list); do
    echo "proxy -6 -n $nopass -a -p$port -i$sunucuip -e$i"
    ((port+=1))
    ((count+=1))
done
