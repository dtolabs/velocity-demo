bin/sh
for i in `knife node list | grep dto- `
do
  knife client delete $i -y
  knife node delete $i -y
done

