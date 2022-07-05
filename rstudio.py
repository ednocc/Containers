#!/usr/bin/env python3

import subprocess
import argparse
import docker

def parse_args():
    parser = argparse.ArgumentParser(description="Create the rstudio container if needed and start it")
    args = parser.parse_args()
    return args

# https://github.com/docker/docker-py/blob/96c12726fdb9b24e985b4de74d5c82145ccd8185/docker/models/containers.py#L518
# Install igraph R package : https://github.com/TomKellyGenetics/r-igraph-docker/blob/master/Dockerfile + https://phoenixnap.com/kb/add-apt-repository-command-not-found-ubuntu (for add-apt-respository)
def main():
    args = parse_args()
    # Actual docker image's name
    image_name = "cconde/rstudio"
    # Name used to run the container
    container_name = "rstudio"
    # Configuration used for the container when creating it for the first time
    container_config = {"environment": ["DISABLE_AUTH=true", "ROOT=TRUE"], # List of env variable to set in the container
                        "ports": {'8787/tcp': ('127.0.0.1', 8787), '8788/tcp': ('127.0.0.1', 8788)}, # Container: Host
                        "volumes": {"/home/cconde/Network": {"bind": "/home/rstudio/work", "mode": "rw"}} # Host: Container
                        }

    # Link to the docker daemon
    client = docker.from_env()
    # if container already exists then get it's id
    if container_name in [c.name for c in client.containers.list(all=True)]:
        container = client.containers.get(container_name)
    else: # Create a new container from the docker image
        image = client.images.get(image_name)
        container = client.containers.create(image, name=container_name, **container_config)
    
    # start the container (container.start() don't support --attach option)
    try:
        subprocess.run(["docker", "start", "--attach", container_name])
    except KeyboardInterrupt:
        container.stop()


if __name__ == '__main__':
    main()
