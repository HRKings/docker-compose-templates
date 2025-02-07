FROM prefecthq/prefect:3-latest

COPY pyproject.toml .

RUN uv sync

ENTRYPOINT ["/opt/prefect/entrypoint.sh", "prefect", "server", "start"]
