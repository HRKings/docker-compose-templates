from typing import List
from prefect import flow
from faker import Faker

from shared.hello_world_common import say_hello, say_goodbye, generate_flow_run_name

@flow(name="hello world", log_prints=True, flow_run_name=generate_flow_run_name)
def greetings(names: List[str]):
    for name in names:
        say_hello(name)
        say_goodbye(name)

if __name__ == "__main__":
    NUM_WORLDS = 10
    fake = Faker()
    greetings([fake.language_name() for _ in range(NUM_WORLDS)])
