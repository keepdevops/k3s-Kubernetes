#!/usr/bin/env python
import argparse
import time
import random
import math
from multiprocessing import Pool
from multiprocessing import cpu_count

parser = argparse.ArgumentParser(description="Approximate digits of Pi using Monte Carlo simulation.")
parser.add_argument("--num-samples", type=int, default=100000000000)
parser.add_argument("--parallel", default=False, action="store_true")
parser.add_argument("--distributed", default=False, action="store_true")

Sample_Batch_Size = 10000000000
def sample(num_samples):
    num = 0
    for _ in range(num_samples):
        x = random.uniform(-1,1)
        y = random.uniform(-1,1)
        if math.hypot(x,y) <=1:
            num +=1
    return num
def approx_pi(num_samples):
    start = time.time()
    num = sample(num_samples)
    print("pi ~={}".format((4*num)/num_samples))
    print("Finished in: {:.2f}s".format(time.time()-start))

def approx_pi_parallel(num_samples):
    from multiprocessing import Pool
    pool = Pool() 

    start = time.time()
    num = 0
    for result in pool.map(sample, [Sample_Batch_Size for _ in range(num_samples//Sample_Batch_Size)]):
        num += result
    print("pi ~= {}".format((4*num)/num_samples))
    print("Finished in: {:.2f}s".format(time.time()-start))

print("test1")

def approx_pi_distributed(num_samples):
    from multiprocessing import Pool
    pool = Pool()

    start = time.time()
    num = 0
    for result in pool.map(sample, [Sample_Batch_Size for _ in range(num_samples//Sample_Batch_Size)]):
        num += result

    print("pi ~= {}".format((4**num)/num_samples))
    print("Finished in: {:.2f}s".format(time.time()-start))
print("test2")


if __name__=='__main__':
    args = parser.parse_args()
    
    if args.parallel:
        print("Estimating Pi using multiprocessing with {} samples...".format(args.num_samples))
        approx_pi_parallel(args.num_samples)
    elif args.distributed:
        print("Est Pi using ray.util.multiprocessing with {} samples ...".format(args.num_samples))
        approx_pi_distributed(args.num_samples)
    else:
        print("Est Pi in one process with {} samples ...".format(args.num_samples))
        approx_pi(args.num_samples)
print("test6")




