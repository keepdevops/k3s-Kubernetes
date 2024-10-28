#!/usr/bin/env python3
#---------
# py-logger
#---------

import time
import socket
import sys

n = len(sys.argv)
print(f'name={sys.argv[0]}')

# DEFAULT DIRECTORY
newdir = "/tmp"

if n > 1:
   #print(f'log num arguments={n}')
   print(f'log dir ={newdir} to connect to...')
   newdir = sys.argv[1]

thisHost = socket.gethostname()
thisHost = newdir + "/log-" + thisHost + ".log"

f = open(thisHost,"a")
for request in range(999999):
    localtime = time.localtime()
    result    = time.strftime("%I:%M:%S %p", localtime)

    f.write(f'{result}\n')
    f.flush()
    print(f'{thisHost} {result}')
    time.sleep(10)

f.close()

# EOF

