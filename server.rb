# Require socket from Ruby Standard Library (stdlib)
require 'socket'                                    

class Server
	
	attr_accessor :lines,:client,:server,:response

	def initialize(host,port)
		# Socket to listen to defined host and port
		@server = TCPServer.open(host,port)
		puts "Accepting connections at --> #{host}:#{port}"
	end

	# Wait for a client to connect. Accept returns a TCPSocket
	def accept_connection
		@client = @server.accept
	end

	#Disconnect from the client
	def close_connection
		@client.close
		puts "Disconnected: #{Time.now.ctime}."
	end

	# Read the request and collect it until it's empty
	def read_request_log
		@lines = []
		while (line = @client.gets.chomp) && !line.empty?  
	    	@lines << line
	  	end
	end

 	#Output the full request to stdout
	def output_full_request
		puts @lines
	end

	def read_file
		@response = 
	end

	# Accepts the array of request lines
	def read_request_path(lines)                
  		if /^[A-Z]+\s+\/(\S++)/ =~ lines[0]       
    		request_path = $1                       
  		end                                  
	end

	#Output current time
	def disp_html

		@client.puts(response)
	end

end


webServer = Server.new("127.0.0.1",8080)

#run server forever
loop do

	#wait for client to connect
	webServer.accept_connection
	webServer.disp_html
	webServer.close_connection

end




