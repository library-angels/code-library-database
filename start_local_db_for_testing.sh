#!/bin/bash
set -e
docker build -t local_db_testing_image -f- . <<EOF
FROM 	postgres
ENV 	POSTGRES_PASSWORD code
WORKDIR /docker-entrypoint-initdb.d/
COPY 	./schema/development.sql 	./001_development.sql
COPY 	./base_dataset/all.sql 		./002_all.sql
COPY 	./export/all.sql 			./003_all.sql
EOF
docker run -it --rm --name local_db_testing_container -p 5432:5432 local_db_testing_image

