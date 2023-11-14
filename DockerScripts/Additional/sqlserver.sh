#!/bin/bash
######################
# Van Elias De Hondt #
######################

docker run -e 'ACCEPT_EULA=Y' -v 'sqldata:/var/opt/mssql' -e 'SA_PASSWORD=DB3&3DB&DB3' -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:2019-latest

docker stop sqlserver
docker start sqlserver
docker kill sqlserver
docker rm sqlserver