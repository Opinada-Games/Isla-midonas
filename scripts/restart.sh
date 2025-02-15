#!/bin/bash
# restart.sh: Stops the Minecraft server, disables maintenance, and restarts the server.

# 1. Stop the existing server cleanly
echo "Stopping the Minecraft server..."
screen -S minecraft_server -X stuff "stop^M"
sleep 10
screen -S minecraft_server -X quit || true

# 2. Disable 'maintenance-enabled: false' in the maintenance config
echo "Disabling maintenance mode in config.yml..."
sed -i 's/maintenance-enabled: true/maintenance-enabled: false/g' /home/minecraft/minecraft_server/plugins/Maintenance/config.yml

# 3. Start new screen session
echo "Starting new Minecraft server..."
cd /home/minecraft/minecraft_server
screen -dmS minecraft_server bash -c 'java -Xmx12G -Xms4G -jar purpur.jar nogui'
