require 'socket'
server = TCPServer.open(27015)
loop {
	Thread.start(server.accept) do |client|
		while line = client.gets
			puts line
		end
	end
}
