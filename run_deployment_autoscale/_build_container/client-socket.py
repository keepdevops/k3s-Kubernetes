#!/usr/bin/env python3
#---------
# CLIENT
#---------

import time
import socket
import sys
import zmq


n = len(sys.argv)

# DEFAULT
myport = "tcp://127.0.0.1:5555"
print(f'name={sys.argv[0]}')

if n > 1:
   print(f'**** num arguments={n}')
   print(f'**** NEW Port Number =>{myport}< to connect to...')
   myport = sys.argv[1]



context = zmq.Context()
mysocket = context.socket(zmq.REQ)
print(f' Attempt connect to {myport}')
#socket.connect("tcp://0.0.0.0:5001") # when outside container
a = mysocket.connect(myport)


thisHost = ":" + socket.gethostname() 
print(f' {thisHost}...connected')

time_start = time.time
for request in range(999999):
    print(f' Sending socket bind request number {request}') 
    #mysocket.send(b" Data from client ")

    mysocket.send_string(f'{thisHost}  request={request}')
    # print(f' ...waiting for ') 

    #message = mysocket.recv()
    message = mysocket.recv_string()
    print(f' {thisHost} reply {message}')
mysocket.send_string(f'clientdone')

# EOF
