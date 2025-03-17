FROM prefecthq/prefect:3-latest

ENV WORKER_NAME = "docker_worker"
ENV WORKER_POOL_NAME = "docker_work_pool"

COPY pyproject.toml .

RUN uv sync

ENTRYPOINT /opt/prefect/entrypoint.sh prefect \
    worker start \
    --with-healthcheck \
    -n $WORKER_NAME \
    -p $WORKER_POOL_NAME \
    -t process
