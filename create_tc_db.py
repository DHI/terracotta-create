import os
import terracotta as tc
from typing import Tuple
import argparse


def create_tc_db(key_names: Tuple[str, ...]):
    driver = tc.get_driver(os.environ["TC_DB_URL"])
    driver.create(key_names)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Create a Terracotta database.")
    parser.add_argument("key_names", nargs="+", help="Keys for the Terracotta database")
    args = parser.parse_args()

    key_names_tuple = tuple(args.key_names)
    create_tc_db(key_names_tuple)
