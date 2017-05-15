#!/usr/bin/env bash

server=$1
private=$2
master=$3
agent=$4

echo Server: "$server"
echo Private: "$private"
echo Master: "$master"
echo Agent: "$agent"

cat server_setup.sh.tmp | sed "s/SERVER_PRIVATE_DNS/${private}/g" > server_setup.sh
mv server_setup.sh ./roles/server/tasks/

cat diskprophet-server.conf.tmp | sed "s/SERVER_PRIVATE_DNS/${private}/g" \
| sed "s/SERVER_NODE_DNS/${server}/g" > diskprophet-server.conf
mv diskprophet-server.conf ./roles/server/tasks/

#cat diskprophet-master.conf.tmp | sed "s/SERVER_NODE_DNS/${server}/g" \
#| sed "s/MASTER_NODE_DNS/${master}/g" > diskprophet-master.conf
#
#mv diskprophet-master.conf ./roles/master/tasks/
#
#cat telegraf.conf.tmp | sed "s/MASTER_NODE_DNS/${master}/g" > telegraf.conf
#mv telegraf.conf ./roles/agent/tasks/
#
#cat diskprophet-agent.conf.tmp | sed "s/MASTER_NODE_DNS/${master}/g" > diskprophet-agent.conf
#mv diskprophet-agent.conf ./roles/agent/tasks/

exit 0