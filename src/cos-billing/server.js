var http = require('http');

const hostname = "192.168.33.14"
const port = 3000;

// Start server

var server = http.createServer(function(req, res) {
  res.setHeader('Content-Type','text/plain');
  res.writeHead(200);
  res.end('Server Billing Demo');
});

server.listen(port, hostname, () => {
  console.log('Server Billing Demo running at');
});
