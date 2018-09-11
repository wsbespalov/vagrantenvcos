var http = require('http');

const hostname = "192.168.33.13"
const port = 3000;

// Start server

var server = http.createServer(function(req, res) {
  res.setHeader('Content-Type','text/plain');
  res.writeHead(200);
  res.end('Server Simulator Demo');
});

server.listen(port, hostname, () => {
  console.log('Server Simulator Demo running at');
});
