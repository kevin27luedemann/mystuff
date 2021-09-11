#!/bin/bash
amixer -M -c 0 set Front playback unmute
amixer -M -c 0 set Line playback unmute
amixer -M -c 0 set Surround playback unmute
amixer -M -c 0 set Center playback unmute
amixer -M -c 0 set LFE playback unmute
amixer -M -c 0 set Headphone 100% unmute
amixer -M -c 0 set Master playback toggle
