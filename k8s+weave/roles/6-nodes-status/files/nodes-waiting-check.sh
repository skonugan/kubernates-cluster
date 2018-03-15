#!/bin/bash

waiting_node=`kubectl get nodes |awk '{print $2}'|egrep  -v "^Ready|^STATUS"| wc -l`
#waiting_pod=2

while [ "$waiting_node" > 0 ];
do
    waiting_node=`kubectl get nodes |awk '{print $2}'|egrep  -v "^Ready|^STATUS"| wc -l`
#    waiting_pod=2
    if [ "$waiting_node" == 0 ]
    then
       echo "Node got added successfully." > /tmp/node-status-check.txt
       rm -rf /tmp/node-status-check.txt;
       exit 0;
    else
       sleep 5;
       echo "Waiting for node to become ready." > /tmp/node-status-check.txt
    fi
done
