# Require socket from Ruby Standard Library (stdlib)
require 'socket'                                    

class Server
	attr_accessor :lines,:client

	def initialize(host,port)
		# Socket to listen to defined host and port
		server = TCPServer.open(host,port)
		puts "Accepting connections at #{host}:#{port}"
		@lines = []
	end

	# Wait for a client to connect. Accept returns a TCPSocket
	def accept_connection
		@client = server.accept
	end

	#Disconnect from the client
	def close_connection
		@client.close
		puts "Disconnected at #{Time.now.ctime}."
	end

	# Read the request and collect it until it's empty
	def read_request_log
		while (line = @client.gets.chomp) && !line.empty?  
	    	lines << line
	  	end
	end

 	#Output the full request to stdout
	def output_full_request
		put lines
	end

	#Output current time
	def disp_current_time
		@client.puts(Time.now.ctime)
	end


end


webServer = Server.new("127.0.0.1",8080)

#run server forever
loop do

	#wait for client to connect
	client = webServer.accept 


end




