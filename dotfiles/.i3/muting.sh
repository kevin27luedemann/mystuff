#!/bin/bash
amixer -M -c 1 set Front playback unmute
amixer -M -c 1 set Line playback unmute
amixer -M -c 1 set Surround playback unmute
amixer -M -c 1 set Center playback unmute
amixer -M -c 1 set LFE playback unmute
amixer -M -c 1 set Headphone 100% unmute
amixer -M -c 1 set Master playback toggle
