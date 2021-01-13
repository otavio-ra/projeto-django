#!/bin/bash

docker build -t otavioalmeida .
docker stop otavioalmeida

docker run -d --rm -p 8001:8000 \
        --env-file $HOME/otavioalmeida.env \
        --name otavioalmeida \
        -v $(pwd)/dkdata:/dkdata \
        otavioalmeida start.sh
