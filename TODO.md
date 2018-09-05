http://192.168.33.10:3000/ to access nodejs server - no ssh tunnel
Use in server.js
  const hostname = "192.168.33.10"
  const port = 3000;
  server.listen(port, hostname, () => {});
It will starts automatically by command:
  node .

http://192.168.33.10:6379/ to access redis server - no ssh tunnel

http://192.168.33.12:27017/ to access mongodb server - no ssh tunnel

- Install Vagrant on your system, http://downloads.vagrantup.com/
- Install virtualbox on your system, https://www.virtualbox.org/
- Install vagrant plugin, vagrant plugin install vagrant-vbguest