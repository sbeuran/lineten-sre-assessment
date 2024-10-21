import os
from http.server import HTTPServer, BaseHTTPRequestHandler
  
class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        client_ip = self.client_address[0]

        full_text = f"Your IP address is {client_ip}"
        full_text_bytes = bytes(full_text, 'utf-8')

        self.send_response(200)
        self.end_headers()
        self.wfile.write(full_text_bytes)


if __name__ == "__main__":

        httpd = HTTPServer(('', 8080), SimpleHTTPRequestHandler)
        httpd.serve_forever()