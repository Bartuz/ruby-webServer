# Require socket from Ruby Standard Library (stdlib)
require 'socket'                                    

class Server

def initialize
	# Socket to listen to defined host and port
	server = TCPServer.open(host,port)
	puts "Accepting connections at #{host}:#{port}"
end

def accept_connection
	# Wait for a client to connect. Accept returns a TCPSocket
	client = server.accept
end

def close_connection
	#Disconnect from the client
	@client.close
	puts "Disconnected at #{Time.now.ctime}."
end

def 


#server runs forever
loop do  
	
	client = server.accept

	lines = []

	# Read the request and collect it until it's empty
	while (line = client.gets.chomp) && !line.empty?  
    	lines << line
  	end

 	#Output the full request to stdout
 	puts lines

 	#Output current time to client
	client.puts(Time.now.ctime)
                                    

  end




