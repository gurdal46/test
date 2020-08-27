#Random  ipv6 uretim
#!/usr/local/bin/bash

array=( 1 2 3 4 5 6 7 8 9 0 a b c d e f )

MAXCOUNT=$(awk 'NR==3' </root/veriler.list )

MAXCOUNT="$(( 10#${MAXCOUNT/[^0-9]} + 0 ))"


SUBNET=$(awk 'NR==2' </root/veriler.list )

SUBNET="$(( 10#${SUBNET/[^0-9]} + 0 ))"


network=$(awk 'NR==1' </root/veriler.list )

network="${network//[[:space:]]/}"

count=1

rnd_ip_block ()
{
    a=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    b=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    c=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    d=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    e=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
 if [[ "x"$SUBNET == "x48" ]]
    then
       
        echo $network:$a:$b:$c:$d:$e
    else
        echo $network:$a:$b:$c:$d
    fi
}
while [ "$count" -le $MAXCOUNT ] 
do
        rnd_ip_block
        let "count += 1"   
        done
