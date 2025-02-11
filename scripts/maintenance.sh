#!/bin/bash
# Sends the /maintenance starttimer 10m command to the Minecraft server screen

screen -S minecraft_server -X stuff "/maintenance starttimer 10m^M"
