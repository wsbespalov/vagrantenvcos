import os
import sys

def main(rgs):
	file = "/etc/mongod.conf"

	if os.path.exists(file):
		with open(file, 'w') as fp:
			contents = fp.read()
			if len(argv) == 0:
				contents.replace("bindIp: 127.0.0.1", 'bindIp: "0.0.0.0, 192.168.33.12" \n  bindIpAll: true')
			else:
				contents.replace("bindIp: 127.0.0.1", 'bindIp: "0.0.0.0, {}" \n  bindIpAll: true'.format(argv[1]))
			fp.write(contents)

if __name__ == "__main__":
	main(sys.argv)