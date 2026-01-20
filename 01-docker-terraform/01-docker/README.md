# Notes

### python env docker command

docker run -it --rm -v $(pwd)/test:/app/test --entrypoint=bash python:3.13.11-slim

Creates a docker container with an installed version of python to run code.

### Remove all stoped containers
```bash
docker rm `docker ps -aq`
```

### Initialize uv project

`uv init --python=3.13`

### Run postgres container

```bash
docker run -it --rm \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v ny_taxi_postgres_data:/var/lib/postgresql \
  -p 5432:5432 \
  postgres:18
```

### Named Volume vs Bind Mount
Named volume (name:/path): Managed by Docker, easier
Bind mount (/host/path:/container/path): Direct mapping to host filesystem, more control

# command to access db on cli
`uv run pgcli -h localhost -p 5432 -u root -d ny_taxi`

# run ingest_data.py
uv run python ingest_data.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table=yellow_taxi_trips \
  --chunksize=100000