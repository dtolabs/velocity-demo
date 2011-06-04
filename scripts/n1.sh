bin/sh
for i in `knife ec2 server list | grep $RUNDECKID  | grep running | awk '{print $1}'`
do
  knife ec2 server delete $i -y
done
for i in `knife rackspace server list | grep $RUNDECKID | awk '{print $1}'`
do
  knife rackspace  server delete $i -y
done

