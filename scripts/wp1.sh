# Start 
#
if [[ $1 == '' ]]
then
echo -n "Role: "
  read role 
else
role=$1
fi

if [[ $2 == '' ]]
then
echo -n "Instance: "
  read instance 
else
instance=$2
fi

nodeid=dto-$role-$instance
echo "Starting AWS Instance for node " $nodeid

knife ec2 server create -r "role[$RUNDECKID],role[$role]" -f m1.large -I ami-b8f405d1 -G default,rundeck-demo -S $RUNDECKID -x ubuntu -N $nodeid 


