#!/bin/bash

cd docker
docker build . -t fmerizen/dev-env
docker push fmerizen/dev-env
