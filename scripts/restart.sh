#!/bin/bash

# 1. Stop existing server
echo "Stopping the Minecraft server..."
screen -S minecraft_server -X stuff "stop^M"
sleep 10
screen -S minecraft_server -X quit || true

# 2. Disable maintenance mode in config
echo "Disabling maintenance mode in config.yml..."
sed -i 's/maintenance-enabled: true/maintenance-enabled: false/g' /home/minecraft/minecraft_server/plugins/Maintenance/config.yml

# 3. Start your server in screen (detached)
cd /home/minecraft/minecraft_server
echo "Starting new Minecraft server..."
screen -dmS minecraft_server bash -c 'java -Xmx12G -Xms4G -jar purpur.jar nogui'

# 4. Wait until the server is ready
# Adjust the grep pattern to match the exact line your server prints when it's done loading.
# Commonly it's: "Done (X.XXXs)! For help, type "help"" in Paper/Purpur logs.
echo "Waiting for server to finish loading..."
LOGFILE="/home/minecraft/minecraft_server/logs/latest.log"

# Loop until we see a "Done" line in the logs
while ! grep -qE "Done \([0-9]+\.[0-9]+s\)! For help, type \"help\"" "$LOGFILE"; do
  sleep 5
done

# 5. The server is ready, so send your command
echo "Server is up. Reloading BlueMap..."
screen -S minecraft_server -X stuff "bluemap reload^M"
echo "BlueMap reloaded."
