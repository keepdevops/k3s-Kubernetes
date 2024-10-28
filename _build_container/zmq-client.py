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
#myport = "tcp://10.0.0.30:5555"
print(f'Client program name={sys.argv[0]}')

if n > 1:
   print(f'**** num arguments={n}')
   print(f'**** NEW Port Number =>{myport}< to connect to...')
   myport = sys.argv[1]



context = zmq.Context()
mysocket = context.socket(zmq.REQ)
print(f'connect to {myport}')
a = mysocket.connect(myport)


print(f'...connected')


time_start = time.time
for request in range(999999):
    print(f'Sending {request}') 
    #mysocket.send(b" Data from client ")

    mysocket.send_string(f'request={request}')

    #message = mysocket.recv()
    socket.gethostname()
    message = mysocket.recv_string()
    print(f'reply {message}')
    print(f'{socket.gethostname()}')
mysocket.send_string(f'clientdone')
