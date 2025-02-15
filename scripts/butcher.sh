#!/bin/bash
# butcher.sh: Sends "boss butcher *" command to the server screen.

screen -S minecraft_server -X stuff "boss butcher *^M"
