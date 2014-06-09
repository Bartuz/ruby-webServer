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
	end

	# Read the request and collect it until it's empty
	def read_request_log
		@lines = []
		while (line = @client.gets.chomp) && !line.empty?  
	    	@lines << line
	  	end
	end

 	#Output the request to stdout
	def output_full_request
		puts @lines
	end

	def read_file(fileName)
		if File.exists?(fileName)
  			file = File.open(fileName,'r') do |f|
				@response = f.read
			end
		else
  			@response = "<h1>404: File Not Found</h1>"
		end		
	end

	def request_path
		path = @lines[0].gsub(/GET \//, '').gsub(/\ HTTP.*/, '')
	end

	#Output html file
	def disp_html
		client.puts(@response)
	end
end


webServer = Server.new("127.0.0.1",8080)

#run server forever
loop do

	#wait for client to connect
	webServer.accept_connection

	#Submit request log
	webServer.read_request_log

	#Read request path
	webServer.read_file(webServer.request_path)

	#display the page
	webServer.disp_html

	#close connection
	webServer.close_connection

end




