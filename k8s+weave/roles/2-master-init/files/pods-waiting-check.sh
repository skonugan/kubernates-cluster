#!/bin/bash

waiting_pod=`kubectl get pods -n kube-system |awk '{print $3}'| wc -l`
#waiting_pod=2

while [ "$waiting_pod" > 0 ];
do
    waiting_pod=`kubectl get pods -n kube-system |awk '{print $3}'|grep -i Running| wc -l`
#    waiting_pod=2
    if [ "$waiting_pod" == 5 ]
    then
       echo "Pods got initialized" > /tmp/pod-status-check.txt
       rm -rf /tmp/pod-status-check.txt;
       exit 0;
    else
       sleep 5;
       echo "Waiting to get pods initialized" > /tmp/pod-status-check.txt
    fi
done
