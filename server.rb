# Require socket from Ruby Standard Library (stdlib)
require 'socket'                                    

# Socket to listen to defined host and port
server = TCPServer.open(host, port)

# Output to stdout that server started                 
puts "Server started on #{host}:#{port} ..."        

#server runs forever
loop do  
	# Wait for a client to connect. Accept returns a TCPSocket
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

	# Disconnect from the client
  	client.close                                      

  end