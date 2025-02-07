# Prefect

This template contains a starter point for using Prefect to orchestrate data

## Running

To spawn just the server and the required database:

```bash
docker compose up server
```

This enter bash inside the server container, where you can run your flows directly just by calling python on them:

```bash
docker compose up cli
```

If you want to spawn the server and a worker:

```bash
docker compose up worker
```

A profile with MinIO is also provided if you need to test something against a S3 like API:

```bash
docker compose up minio
```
