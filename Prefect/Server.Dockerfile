FROM prefecthq/prefect:3-latest

COPY pyproject.toml .

RUN uv sync

ENTRYPOINT ["uv", "run"]
