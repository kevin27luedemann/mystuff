#!/usr/bin/python
# -*- coding: utf-8 -*-
import numpy as np
import sys
import time as ti
import datetime as dt

"""
Legend of workhour time syntax:

time in seconds <tab> timestamp <tab> type code

Legend of type codes:

    0: in time
    1: out time
    2: pause in time
    3: pause out time
    4: vacation in time
    5: vacation out time
"""

def append_time(name,line):
    f = open(name,"a")
    f.write(line)

def decode_line(line):
    a, b, c = line.split('\t')
    c = c[:-1]
    return np.float(a),b,np.float(c)

def get_hours(name):
    timest = []
    formated = []
    code = []
    for line in open(name):
        a,b,c = decode_line(line)
        timest.append(a)
        formated.append(b)
        code.append(c)
    return timest, formated, code

def get_digits(timestring):
    times, dates = timestring.split('_')
    hours, minutes, seconds = times.split(':')
    days, months, years = dates.split('.')
    return (np.int(hours),np.int(minutes),np.int(seconds)),(np.int(days),np.int(months),np.int(years))

def tail( f, lines=20 ):
    total_lines_wanted = lines

    BLOCK_SIZE = 1024
    f.seek(0, 2)
    block_end_byte = f.tell()
    lines_to_go = total_lines_wanted
    block_number = -1
    blocks = [] # blocks of size BLOCK_SIZE, in reverse order starting
                # from the end of the file
    while lines_to_go > 0 and block_end_byte > 0:
        if (block_end_byte - BLOCK_SIZE > 0):
            # read the last block we haven't yet read
            f.seek(block_number*BLOCK_SIZE, 2)
            blocks.append(f.read(BLOCK_SIZE))
        else:
            # file too small, start from begining
            f.seek(0,0)
            # only read what was not read
            blocks.append(f.read(block_end_byte))
        lines_found = blocks[-1].count('\n')
        lines_to_go -= lines_found
        block_end_byte -= BLOCK_SIZE
        block_number -= 1
    all_read_text = ''.join(reversed(blocks))
    return '\n'.join(all_read_text.splitlines()[-total_lines_wanted:])

def in_time(name):
    ts = ti.time()
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"0")
    append_time(name,logg)
    print "In time {} logged".format(formated_time)

def out_time(name):
    ts = ti.time()
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"1")
    append_time(name,logg)
    print "Out time {} logged".format(ts)

def pause_in_time(name):
    ts = ti.time()
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"2")
    append_time(name,logg)
    print "Pause in time {} logged".format(ts)

def pause_out_time(name):
    ts = ti.time()
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"3")
    append_time(name,logg)
    print "Pause out time {} logged".format(ts)

def vacation_in_time(name):
    ts = ti.time()
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"4")
    out_time(name)
    append_time(name,logg)
    print "vacation in time {} logged".format(ts)

def vacation_out_time(name):
    ts = ti.time()
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"5")
    in_time(name)
    append_time(name,logg)
    print "vacation in time {} logged".format(ts)

def workhours(name, hours_per_month):
    print "You worked for ..."
    timest, formated, code = get_hours(name)
    #times, dates = get_digits(formated[0])

def main():
    name = ".worktime_dt.txt"
    hours_per_month = 40
    if len(sys.argv) > 1:
        if sys.argv[1] == "in":
            in_time(name)
        if sys.argv[1] == "out":
            out_time(name)
        if sys.argv[1] == "pausein":
            pause_in_time(name)
        if sys.argv[1] == "pauseout":
            pause_out_time(name)
        if sys.argv[1] == "vacationin":
            vacation_in_time(name)
        if sys.argv[1] == "vacationout":
            vacation_out_time(name)
    else:
        workhours(name,hours_per_month)

if __name__ == "__main__":
    main()
