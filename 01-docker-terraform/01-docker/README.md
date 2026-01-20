# Notes


## Pipeline config notes

### Create a docker network for container internal communication
`docker network create pg-network`

### Run postgres container

```bash
docker run -it --rm \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v ny_taxi_postgres_data:/var/lib/postgresql \
  -p 5432:5432 \
  --network=pg-network \
  --name pgdatabase \
  postgres:18
```
#### Named Volume vs Bind Mount
Named volume (name:/path): Managed by Docker, easier
Bind mount (/host/path:/container/path): Direct mapping to host filesystem, more control


#### command to access db on cli
`uv run pgcli -h localhost -p 5432 -u root -d ny_taxi`


#### Pg admin to access the data on web interface
```bash
docker run -it --rm \
  -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
  -e PGADMIN_DEFAULT_PASSWORD="root" \
  -v pgadmin_data:/var/lib/pgadmin \
  -p 8085:80 \
  --network=pg-network \
  --name pgadmin \
  dpage/pgadmin4
```

#### Run the containarized data ingestion
```bash
docker run -it --rm \
  --network=pg-network \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table=yellow_taxi_trips
```

--host=pgdatabase: As it runs on another container the host is that container


### run ingest_data.py host
```bash
uv run python ingest_data.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table=yellow_taxi_trips \
  --chunksize=100000
```


## Other notes

### Remove all stoped containers
```bash
docker rm `docker ps -aq`
```

### Initialize uv project
`uv init --python=3.13`