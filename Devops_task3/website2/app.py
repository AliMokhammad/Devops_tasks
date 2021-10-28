#!/usr/bin/env python
# -*- coding: UTF-8 -*-

from datetime import datetime
import os

print("Content-Type: text/html\n")
print("<h1>Current date is: " + datetime.now().strftime('%Y-%m-%d %H:%M:%S') + "</h1>")
print("<h2>Your IP is: " + os.environ["REMOTE_ADDR"] + "</h2>") 
print("<h2>User agent: " + os.environ["HTTP_USER_AGENT"] + "</h2>")