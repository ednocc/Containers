#!/usr/bin/env python3

import subprocess
import argparse
import docker

def parse_args():
    parser = argparse.ArgumentParser()
    args = parser.parse_args()
    return args

# https://github.com/docker/docker-py/blob/96c12726fdb9b24e985b4de74d5c82145ccd8185/docker/models/containers.py#L518
def main():
    args = parse_args()
    # Actual docker image's name
    image_name = "jupyter/datascience-notebook"
    # Name used to run the container
    container_name = "jupyter"
    # Configuration used for the container when creating it for the first time
    container_config = {"ports": {'8888/tcp': ('127.0.0.1', 8888)}, # Container: Host
                        "volumes": {"/home/cconde/Network": {"bind": "/home/jovyan/work", "mode": "rw"}} # Host: Container
                        }
    
    # Link to the docker daemon
    client = docker.from_env()
    if container_name in [c.name for c in client.containers.list(all=True)]:
        container = client.containers.get(container_name)
    else:
        image = client.images.get(image_name)
        # tty (bool), stdin_open (bool) = --tty, --interactive 
        container = client.containers.create(image, "start.sh jupyter lab", name=container_name)
    
    # start the container (container.start() don't support --attach option)
    try:
        subprocess.run(["docker", "start", "--attach", container_name])
    except KeyboardInterrupt:
        container.stop()


if __name__ == '__main__':
    main()
