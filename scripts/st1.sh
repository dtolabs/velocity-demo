echo "**** Status Nodes ***"
knife status --run-list | grep rundeck_demo 
echo "**** EC2 Nodes ***"
knife ec2 server list  | grep rundeck_demo | grep running
