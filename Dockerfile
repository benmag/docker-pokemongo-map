FROM python:2.7-alpine

# Set environment variables that can be overwritten 
ENV USERNAME "username"
ENV PASSWORD "password"
ENV LOCATION "LAT LON"
ENV GOOGLE_MAPS_KEY "google-maps-api-key"

# Working directory for the application
WORKDIR /usr/src/app

# add certificates to talk to the internets
RUN apk add --no-cache ca-certificates git nano 

# Clone app into workdir
RUN git clone https://github.com/AHAAAAAAA/PokemonGo-Map .

# Install all prerequisites (build base used for gcc of some python modules)
RUN apk add --no-cache build-base \
 && pip install --no-cache-dir -r requirements.txt \
 && apk del build-base

# Default port the webserver runs on
EXPOSE 5000

CMD python runserver.py -a ptc -u $USERNAME -p $PASSWORD -l "$LOCATION" -st 10 -k $GOOGLE_MAPS_KEY --host 0.0.0.0