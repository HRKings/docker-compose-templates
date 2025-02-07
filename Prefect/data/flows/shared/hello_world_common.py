from typing import List

from prefect import task
from prefect.runtime import flow_run, task_run
import datetime

def generate_task_run_name() -> str:
    task_name = task_run.task_name

    parameters = task_run.parameters
    name: str = parameters["name"]

    date = datetime.datetime.now(datetime.timezone.utc)

    return f"{task_name}#{name}@{date:%Y-%m-%d.%H:%M:%S}"

@task(task_run_name=generate_task_run_name)
def say_hello(name: str):
    print(f"logging: for {name}")

@task(task_run_name=generate_task_run_name)
def say_goodbye(name: str):
    print(f"logging for {name}")

def generate_flow_run_name() -> str:
    flow_name = flow_run.flow_name

    parameters = flow_run.parameters
    names: List[str] = parameters["names"]

    date = datetime.datetime.now(datetime.timezone.utc)

    return f"{flow_name}#{len(names)}@{date:%Y-%m-%d.%H:%M:%S}"