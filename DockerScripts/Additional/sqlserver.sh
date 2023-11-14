#!/bin/bash
######################
# Van Elias De Hondt #
######################

# https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash
docker run -e 'ACCEPT_EULA=Y' -v 'sqldata:/var/opt/mssql' -e 'SA_PASSWORD=DB3&3DB&DB3' -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:2019-latest

docker cp /home/elias/catchem2324.bak sqlserver:/tmp/catchem2324.bak # Copy file to container


docker stop sqlserver
docker start sqlserver
docker kill sqlserver
docker rm sqlserver