#!/usr/bin/env python3 

from multiprocessing import Pool
from multiprocessing import cpu_count

import signal
import time

stop_loop = 0

def exit_child(x,y):
    global stop_loop
    stop_loop = 1

def ftest(x):
    start_time = time.time()
    print(f'start_time = {start_time}')
    global stop_loop
    while not stop_loop:
        delta_time = time.time() - start_time
        if delta_time > 60.0:
            stop_loop = 1
        x*x

signal.signal(signal.SIGINT, exit_child)

if __name__ == '__main__':
    processes = cpu_count()
    print('-' * 20)
    print('running load on CPU(s)')
    print('Utilizing %d cores' % processes)
    print('-' * 20)
    pool  = Pool(processes)
    pool.map(ftest,range(processes))


