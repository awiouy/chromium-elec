#!/bin/bash

while [ ! $(ps axg | grep -vw grep | grep -w chromium-browser) ]; do sleep 1; done;

cec-client|nc -u 127.0.0.1 1234
