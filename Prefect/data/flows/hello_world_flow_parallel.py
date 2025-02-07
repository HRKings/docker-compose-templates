import random
from typing import List
from prefect import flow, task
from faker import Faker

from shared.hello_world_common import generate_flow_run_name, say_hello, say_goodbye

@task
def transform_name(name: str) -> str:
    number = random.randint(0, 100)
    return f"{name}_{number}"

@flow(name="parallel hello world", log_prints=True, flow_run_name=generate_flow_run_name)
def greetings(names: List[str]):
    result = transform_name.map(names).result()

    say_hello.map(result).result()
    say_goodbye.map(result).result()

if __name__ == "__main__":
    NUM_WORLDS = 10
    fake = Faker()
    greetings([fake.language_name() for _ in range(NUM_WORLDS)])
