#!/usr/bin/env python3
# --------------
# SERVER
# --------------
# Binds REP socket to tcp://*:5555
#

import zmq
import time
import subprocess

context = zmq.Context()
socket = context.socket(zmq.REP)

print(f'bind to 5555')
socket.bind("tcp://*:5555")
print(f'...bind')

MSG_COUNT = 111
while True:
    MSG_COUNT = MSG_COUNT + 1
    print(f'\n{MSG_COUNT}')
    #message = socket.recv()
    message = socket.recv_string()
    print(f'>{message}<')

    if message == "request=cputest" :
        print(f'test')
        subprocess.call("./python_stress.py",shell=True)

    time.sleep(1)
    socket.send_string(f'{MSG_COUNT}')

