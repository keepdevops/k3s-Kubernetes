#!/usr/bin/env python3 

from multiprocessing import Pool
from multiprocessing import cpu_count

import signal
import time
import sys
import socket

stop_loop = 0
# DEFAULT
duration = 60.0

def exit_child(x,y):
    global stop_loop
    stop_loop = 1

def ftest(x):
    start_time = time.time()
    global stop_loop
    while not stop_loop:
        delta_time = time.time() - start_time
        if delta_time > duration:
            stop_loop = 1
        x*x

signal.signal(signal.SIGINT, exit_child)

if __name__ == '__main__':

    n = len(sys.argv)
    if n > 1:
        duration = float(sys.argv[1])


    processes = cpu_count()
    pool  = Pool(processes)

    thisHost = socket.gethostname()

    print(f'{thisHost}: Load Start {duration}sec.')
    pool.map(ftest,range(processes))
    print(f'{thisHost}: Load Done ')

#EOF
