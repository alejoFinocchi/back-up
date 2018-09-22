require 'socket'
hostname = 'localhost'
port=27015
s = TCPSocket.open(hostname, port)

while a = gets
	s.puts a
end

s.close