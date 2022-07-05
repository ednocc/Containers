#!/usr/bin/env python3

from threading import Thread
import subprocess

class RunConda(Thread):
    def __init__(self):
        Thread.__init__(self)

    def run(self):
        subprocess.run(["docker", "exec", "-it", "conda", "/bin/bash"])

def main():
    container = RunConda()
    container.start()
    container.join()

if __name__ == '__main__':
    main()
