#!/usr/bin/python
# -*- coding: utf-8 -*-
import numpy as np
import sys
import time as ti
import datetime as dt
from pathlib import Path

"""
Legend of workhour time (day) syntax:
time in seconds <tab> timestamp <tab> type code

Legend of workhour time systax:
time in seconds <tab> timestamp <tab> workhours <tab> workhourse stamp <tab> pausehours <tab> pausehours stamp <tab> total time <tab> total time stamp <tab> work pause ratio <tab> work percentage <tab> pause percentage

Legend of workhour time print systax:
timestamp <tab> workhourse stamp <tab> pausehours stamp <tab> total time stamp <tab> work pause ratio <tab> work percentage <tab> pause percentage

Legend of type codes:
    0: in time
    1: out time
    2: pause in time
    3: pause out time
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
    return '\n'.join(all_read_text.splitlines()[-total_lines_wanted:])+'\n'

def in_time(name,ts):
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    formated_date = dt.datetime.fromtimestamp(ts).strftime('%y%m%d')
    name = name+"_"+formated_date+".txt"
    my_file = Path(name)
    if my_file.is_file():
        a,b,c = decode_line(tail(open(name),1))
        assert c == 1 , "not clocked out"
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"0")
    append_time(name,logg)
    print "In time {} logged".format(formated_time)

def out_time(name,ts):
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    formated_date = dt.datetime.fromtimestamp(ts).strftime('%y%m%d')
    name_out = name+"_"+formated_date+".txt"
    my_file = Path(name_out)
    if my_file.is_file():
        a,b,c = decode_line(tail(open(name_out),1))
        if c == 2:
            pause_out_time(name,ts)
        assert c != 1 , "already clocked out"
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"1")
    append_time(name+"_"+formated_date+".txt",logg)
    print "Out time {} logged".format(formated_time)

def pause_in_time(name,ts):
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    formated_date = dt.datetime.fromtimestamp(ts).strftime('%y%m%d')
    name = name+"_"+formated_date+".txt"
    my_file = Path(name)
    if my_file.is_file():
        a,b,c = decode_line(tail(open(name),1))
        assert c == 0 or c == 3 , "not clocked in or pause not ended"
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"2")
    append_time(name,logg)
    print "Pause in time {} logged".format(formated_time)

def pause_out_time(name,ts):
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    formated_date = dt.datetime.fromtimestamp(ts).strftime('%y%m%d')
    name_out = name+"_"+formated_date+".txt"
    my_file = Path(name_out)
    if my_file.is_file():
        a,b,c = decode_line(tail(open(name_out),1))
        assert c == 2 , "pause not begun"
    logg = "{}\t{}\t{}\n".format(ts,formated_time,"3")
    append_time(name_out,logg)
    print "Pause out time {} logged".format(formated_time)


def calculate_dayworktime(name):
    #parser for the day worktime
    my_file = Path(name)
    assert my_file.is_file() , "File does not exist"
    timest, formated, code = get_hours(name)
    time_in_day = 0
    pause_time = 0
    assert code[0]==0 , "did not clock in"
    assert code[-1]==1 , "did not clock out"
    for i in range(len(code)):
        if code[i] == 0:
            time_start = timest[i]
            time_stop  = 0.0
        elif code[i] == 2:
            pause_start = timest[i]
            pause_stop  = 0.0
        elif code[i] == 3:
            pause_stop = timest[i]
            pause_time = pause_time + (pause_stop-pause_start)
        elif code[i] == 1:
            time_stop = timest[i]
            time_in_day = time_in_day + (time_stop-time_start)

    time_in_day = time_in_day - pause_time
    return time_in_day, pause_time

def calculate_dayworktime_before_end(name,ts):
    #parser for the day worktime
    my_file = Path(name)
    assert my_file.is_file() , "File does not exist"
    timest, formated, code = get_hours(name)
    time_in_day = 0
    pause_time = 0
    assert code[0]==0 , "did not clock in"
    for i in range(len(code)):
        if code[i] == 0:
            time_start = timest[i]
            time_stop  = 0.0
        elif code[i] == 2:
            pause_start = timest[i]
            pause_stop  = 0.0
        elif code[i] == 3:
            pause_stop = timest[i]
            pause_time = pause_time + (pause_stop-pause_start)
        elif code[i] == 1:
            time_stop = timest[i]
            time_in_day = time_in_day + (time_stop-time_start)
    time_stop = ts
    time_in_day = time_in_day + (time_stop-time_start)

    time_in_day = time_in_day - pause_time
    return time_in_day, pause_time

def logg_daywork(name,ts):
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    formated_date = dt.datetime.fromtimestamp(ts).strftime('%y%m%d')
    work, pause = calculate_dayworktime(name+"_"+formated_date+".txt")
    work_stamp = dt.datetime.fromtimestamp(work).strftime('%H:%M:%S')
    pause_stamp = dt.datetime.fromtimestamp(pause).strftime('%H:%M:%S')
    total_time = work+pause
    total_time_stamp = dt.datetime.fromtimestamp(total_time).strftime('%H:%M:%S')
    work_pause_ratio = work/pause
    work_percent = work/total_time*100.0
    pause_percent = pause/total_time*100.0
    logg = "{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(ts,formated_time,work,work_stamp,pause,pause_stamp,total_time,total_time_stamp,work_pause_ratio,work_percent,pause_percent)
    #logg = "{}\t{}\t{}\t{}\t{}\t{}\n".format(ts,formated_time,work,work_stamp,pause,pause_stamp)
    append_time(name+".txt",logg)

def print_daywork(name,ts):
    formated_time = dt.datetime.fromtimestamp(ts).strftime('%H:%M:%S_%d.%m.%y')
    formated_date = dt.datetime.fromtimestamp(ts).strftime('%y%m%d')
    name_date = name+"_"+formated_date+".txt"
    my_file = Path(name_date)
    if my_file.is_file():
        a,b,c = decode_line(tail(open(name_date),1))
        assert c == 3 or c == 1 , "still in pause"
        if c == 1:
            work, pause = calculate_dayworktime(name_date)
        else:
            work, pause = calculate_dayworktime_before_end(name_date,ts)
    work_stamp = dt.datetime.fromtimestamp(work).strftime('%H:%M:%S')
    pause_stamp = dt.datetime.fromtimestamp(pause).strftime('%H:%M:%S')
    total_time = work+pause
    total_time_stamp = dt.datetime.fromtimestamp(total_time).strftime('%H:%M:%S')
    work_pause_ratio = work/pause
    work_percent = work/total_time*100.0
    pause_percent = pause/total_time*100.0
    logg = "{}\t{}\t{}\t{}\t{:.02f}\t{:.01f}%\t{:.01f}%\n".format(formated_time,work_stamp,pause_stamp,total_time_stamp,work_pause_ratio,work_percent,pause_percent)
    print logg,

def workhours(name, hours_per_month):
    print "You worked for ..."
    timest, formated, code = get_hours(name)
    #times, dates = get_digits(formated[0])

def main():
    ts = ti.time()
    path = "/home/upgp/kevin/hours/"
    name = "worktime_dt"
    hours_per_month = 40
    if len(sys.argv) > 1:
        if sys.argv[1] == "in":
            in_time(path+name,ts)
        if sys.argv[1] == "out":
            out_time(path+name,ts)
        if sys.argv[1] == "pausein" or sys.argv[1] == "pin":
            pause_in_time(path+name,ts)
        if sys.argv[1] == "pauseout" or sys.argv[1] == "pout":
            pause_out_time(path+name,ts)
        if sys.argv[1] == "daycalc" or sys.argv[1] == "dc":
            logg_daywork(path+name,ts)
        if sys.argv[1] == "daywork" or sys.argv[1] == "dw":
            print_daywork(path+name,ts)
    else:
        workhours(name,hours_per_month)

if __name__ == "__main__":
    main()
