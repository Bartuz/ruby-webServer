require 'socket'

server = TCPServer.open("127.0.0.1",8080)
puts "Accepting connections"

loop do 
	client = server.accept

	lines = []
	while (line = client.gets.chomp) && !line.empty?  
	   	lines << line
	end

	filename = lines[0].gsub(/GET \//, '').gsub(/\ HTTP.*/, '')

	if File.exists?(filename)
	  response = File.read(filename)
	else
	  response = "File Not Found"
	end

	client.puts(response)

	client.close
	puts "Disconnected: #{Time.now.ctime}."

end
