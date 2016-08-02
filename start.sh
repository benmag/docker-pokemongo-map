#!/bin/bash

# Write config.ini file with env vars
echo -e \
"auth-service: ptc \n" \
"username: $USERNAME \n" \
"password: $PASSWORD \n" \
"location: $LOCATION \n" \
"gmaps-key: $GOOGLE_MAPS_KEY \n" \
"host: 0.0.0.0" > config/config.ini

# Start bot 
python runserver.py 