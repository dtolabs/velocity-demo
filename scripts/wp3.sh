# Start opsmn01
#
nohup knife ec2 server create "role[wordpress]" "role[monitoring]" -f m1.large -i ami-b8f405d1 -G default,wordpress -S botchagalupe -x ubuntu -I ~/chef-repo/.chef/botchagalupe.pem -N opsmn01 -y >/tmp/opsmn01.out &

# Start opsmn02
#
nohup knife ec2 server create "role[wordpress]" "role[datacollect]" -f m1.large -i ami-b8f405d1 -G default,wordpress -S botchagalupe -x ubuntu -I ~/chef-repo/.chef/botchagalupe.pem -N opsmn02 -y >/tmp/opsmn02.out &

# Start opsdm01 
#
nohup knife ec2 server create "role[wordpress]" "role[database_master]" -f m1.large -i ami-b8f405d1 -G default,wordpress -S botchagalupe -x ubuntu -I ~/chef-repo/.chef/botchagalupe.pem -N opsdm01 -y >/tmp/opsdm01.out &

# Start opsds01 
#
nohup knife ec2 server create "role[wordpress]" "role[database_slave]" -f m1.large -i ami-b8f405d1 -G default,wordpress -S botchagalupe -x ubuntu -I ~/chef-repo/.chef/botchagalupe.pem -N opsds01 -y >/tmp/opsds01.out &

# Start opsds02 
#
nohup knife rackspace server create "role[wordpress]" "role[database_slave]" --server-name opsds02 --image 49 --flavor 2 -y >/tmp/opsds02.out &

# Start opslb01 
#
nohup knife ec2 server create "role[wordpress]" "role[load_balancer]" -f m1.large -i ami-b8f405d1 -G default,wordpress -S botchagalupe -x ubuntu -I ~/chef-repo/.chef/botchagalupe.pem -N opslb01 -y >/tmp/opslb01.out &

# Start opsws01 
#
nohup knife ec2 server create "role[wordpress]" "role[webserver]" -f m1.large -i ami-b8f405d1 -G default,wordpress -S botchagalupe -x ubuntu -I ~/chef-repo/.chef/botchagalupe.pem -N opsws01 -y >/tmp/opsws01.out &

# Start opsws02 
#
nohup knife rackspace server create "role[wordpress]" "role[webserver]" --server-name opsws02 --image 49 --flavor 2 -y >/tmp/opsws02.out &

