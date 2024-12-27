#!/bin/bash

file=$1

    countRows=$(wc $file | awk '{print $1}')
    
    periodFrom=$(awk '{print $4 $5}' $file | sed 's/\[//; s/\]//' | sed -n 1p)
    periodTo=$(awk '{print $4 $5}' $file | sed 's/\[//; s/\]//' | sed -n "$countRows"p)

    
    
    ips=$(awk '{print $1}' $file | uniq -c | sort -nrk 1 | awk 'BEGIN{print"№ count IP"}{print FNR,$1,$2}'| column -t)
    
    addresses=$(awk '($9 ~ /200/)' $file | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{ if ( $1 >= 10 ) { print "Количество запросов:" $1, "URL:" $2 } }')
    
    errors=$(cat $file | cut -d '"' -f3 | cut -d ' ' -f2 | sort | uniq -c | sort -rn)
    
    
    
    echo -e "Данные за период:$periodFrom-$periodTo\n$ips\n\n"Часто запрашиваемые адреса: "\n$addresses\n\n"Частые ошибки:"\n$errors" | mail -s "NGINX Log Info" root@localhost
