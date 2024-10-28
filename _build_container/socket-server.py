#!/usr/bin/env python3
#---------------------
# Server
#--------------------
# Bind REP socket to tcp://*:5555
#

import zmq
import time
import subprocess

context= zmq.Context()
socket = context.socket(zmq.REP)

print(f'Attempt to bind 5555')
socket.bind("tcp://*:5555")
print(f'...bind')

MSG_COUNT = 3579
while True:
    MSG_COUNT = MSG_COUNT + 1

    #print(f'\n: {MSG_COUNT}')
    #message = socket.recv()

    message = socket.recv_string()
    print(f'listener-bind:  {MSG_COUNT}   {message}')

    if message == "request=cputest" :
        print(f'listener-bind ')
        ## execfile("python_stress.py")
        subprocess.call("./python_stress.py",shell=True)

    time.sleep(1)
    socket.send_string(f'Package reponse count = {MSG_COUNT}')

        
