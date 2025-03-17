import random
from typing import List
from prefect import flow, task
from faker import Faker

from shared.hello_world_common import generate_flow_run_name, generate_flow_run_name_entrypoint, say_hello, say_goodbye

@task
def transform_name(name: str) -> str:
    number = random.randint(0, 100)
    return f"{name}_{number}"

@flow(name="parallel hello world", log_prints=True, flow_run_name=generate_flow_run_name)
def greetings(names: List[str]):
    result = transform_name.map(names)

    say_hello.map(result).result()
    say_goodbye.map(result).result()

@flow(name="parallel hello world entrypoint", log_prints=True, flow_run_name=generate_flow_run_name_entrypoint)
def main(num_worlds):
    fake = Faker()

    greetings([fake.language_name() for _ in range(int(num_worlds))])

if __name__ == "__main__":
    main(10)
