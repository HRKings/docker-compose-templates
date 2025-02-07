FROM prefecthq/prefect:3-latest

RUN uv pip install prefect-aws
RUN uv pip install faker
