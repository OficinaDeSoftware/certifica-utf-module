#!/usr/bin/env bash

./postgres/install.sh

./docker/install.sh
./docker/build.sh
./docker/start.sh
