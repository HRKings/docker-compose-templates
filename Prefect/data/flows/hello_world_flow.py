from typing import List
from prefect import flow
from faker import Faker

from shared.hello_world_common import say_hello, say_goodbye, generate_flow_run_name_entrypoint

@flow(name="hello world", log_prints=True, flow_run_name=generate_flow_run_name_entrypoint)
def main(num_worlds: int):
    fake = Faker()
    names = [fake.language_name() for _ in range(num_worlds)]

    for name in names:
        say_hello(name)
        say_goodbye(name)

if __name__ == "__main__":
    main(10)
