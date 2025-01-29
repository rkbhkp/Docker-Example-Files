#!/bin/bash
#script to restart server every defined amount of time
broadcast_countdown() {
	local minutes=$1
	local message=$2

	for ((i = minutes; i > 0; i--)); do
		docker exec -it palworld-server rcon-cli "Broadcast ${message}_in_${i}_minutes"
		sleep 60
	done
}

#broadcast_countdown 0 "Automated_Server_restart"

docker exec -it palworld-server rcon-cli "Broadcast Server_will_backup_in_15_seconds"

docker exec -it palworld-server rcon-cli "Save"
docker exec palworld-server backup

sleep 2

docker restart palworld-server
