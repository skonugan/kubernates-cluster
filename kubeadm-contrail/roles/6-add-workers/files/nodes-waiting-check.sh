#!/bin/bash

waiting_node=`docker ps|awk '{print $7}'|egrep -v "^STATUS|^PORT|^Up"|wc -l`
#waiting_pod=2

while [ "$waiting_node" > 0 ];
do
    waiting_node=`docker ps|awk '{print $7}'|egrep -v "^STATUS|^PORT|^Up"|wc -l`
#    waiting_pod=2
    if [ "$waiting_node" == 0 ]
    then
       echo "Node is Ready" > /tmp/node-status-check.txt
       rm -rf /tmp/node-status-check.txt;
       exit 0;
    else
       sleep 5;
       echo "Waiting to get Node Ready" > /tmp/node-status-check.txt
    fi
done
