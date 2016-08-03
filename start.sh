#!/bin/bash

# Write config.ini file with env vars
echo -e \
"auth-service: ptc \n" \
"username: $USERNAME \n" \
"password: $PASSWORD \n" \
"location: $LOCATION \n" \
"gmaps-key: $GOOGLE_MAPS_KEY \n" \
"db-type: mysql \n" \
"host: 0.0.0.0 \n" > config/config.ini

if [ "$DB_TYPE" = "mysql" ]; then 
	echo -e "db-host: $DB_HOST \n" \
			"db-name: $DB_NAME \n" \
			"db-user: $DB_USER \n" \
			"db-pass: $DB_PASS \n" >> config/config.ini
fi 

if [ -n "$ONLY_SERVER" ]; then
	echo -e "only-server: $ONLY_SERVER \n " >> config/config.ini
fi

if [ -n "$NO_SEARCH_CONTROL" ]; then 
	echo -e "no-search-control: $NO_SEARCH_CONTROL \n " >> config/config.ini
fi

# Start bot 
python runserver.py