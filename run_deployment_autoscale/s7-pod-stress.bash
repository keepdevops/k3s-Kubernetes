#!/bin/bash

echo "[LOAD TEST]"
echo ""
duration="30"

kubectl get pods | grep Running | grep -v NAME | cut -d " " -f1 > /tmp/tmp-aaa.txt
while INPUT= read -r aaa; do
	echo "[ADDING LOAD TO POD $aaa FOR $duration SEC.]"
	kubectl exec  ${aaa}  -- sh -c  "stress-ng --cpu 8 --timeout ${duration}" &
echo ""
done < "/tmp/tmp-aaa.txt"


sleep ${duration}
sleep ${duration}
sleep ${duration}

echo "LOAD DONE"

#EOF
