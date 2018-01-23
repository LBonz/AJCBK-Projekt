#!/bin/bash
lxterminal -t "NPM"  --geometry=40x2 --working-directory="/home/pi/Desktop/alexa-avs-sample-app/samples/companionService" -e "npm start " &
sleep 15
lxterminal -t "JVM"  --geometry=40x2 --working-directory="/home/pi/Desktop/alexa-avs-sample-app/samples/javaclient" -e "sudo mvn exec:exec" &
sleep 30
lxterminal -t "WAKE" --geometry=40x2 --working-directory="/home/pi/Desktop/alexa-avs-sample-app/samples/wakeWordAgent/src" -e "./wakeWordAgent -e kitt_ai" &