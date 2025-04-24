#!/bin/bash

### RISK: LOW
### by Cloudian (mgerecke@cloudian.com) Jan-2021

### Get all tasks with status INPROGRESS.
### This script needs to be run from the puppetmaster.

staging=$(grep installscript /opt/cloudian/conf/cloudianservicemap.json | tr '"' '\n' | grep cloudianInstall.sh | sed 's/\/cloudianInstall.sh//')

for IP in `awk '{print $3}' ${staging}/hosts.cloudian | sort`
do
        echo -en "${IP}\t"
        /opt/cloudian/bin/hsstool -h ${IP} opstatus | grep INPROGRESS
        echo -en "\r"
done
