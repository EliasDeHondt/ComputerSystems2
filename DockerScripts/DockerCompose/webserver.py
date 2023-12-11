#!/usr/bin/env python3
######################
# Van Elias De Hondt #
######################
# python3 webserver.py

# If necessary install python with:
# sudo apt-get install python3 pip3
# pip3 install http.server

from http.server import BaseHTTPRequestHandler, HTTPServer
import time
hostName = "172.16.16.16"
hostPort = 8765
class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type","text/html") 
        self.end_headers()
        self.wfile.write(bytes("Dit is een python webserver","utf-8"))
myServer = HTTPServer((hostName, hostPort), MyServer)
print(time.asctime(), "Server Starts - %s:%s" % (hostName, hostPort))
try:
    myServer.serve_forever()
except KeyboardInterrupt:
    pass
myServer.server_close()
print(time.asctime(), "Server Stops - %s:%s" % (hostName, hostPort))