@echo off
setlocal
cd %~dp0

set COMPOSE_PROJECT_NAME=devenv

docker-compose up -d
docker exec -ti %COMPOSE_PROJECT_NAME%_shell_1 /bin/bash
