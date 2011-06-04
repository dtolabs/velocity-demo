echo "**** Status Nodes ***"
knife status --run-list | grep rundeck-demo
echo "**** EC2 Nodes ***"
knife ec2 server list  | grep rundeck-demo | grep running
