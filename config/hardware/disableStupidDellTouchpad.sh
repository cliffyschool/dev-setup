#!/bin/sh

ID=`xinput list | grep -Eo 'Touch[P|p]ad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
xinput set-prop $ID "Device Enabled" 0
