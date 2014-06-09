#simplifies network programming enormously
require 'socket'

#server bound to port 8080
server = TCPServer.new('127.0.0.1',8080)


while (session = server.accept)
	session.print "HTTP/1.1 200/OK\r\nContent-type:text/html\r\n\r\n"
	request = session.gets
	trimmedRequest = request.gsub(/GET\ \//, '').gsub(/\ HTTP.*/, '')

	filename = trimmedRequest.chomp
	
	
	if(filename == "")
		filename = "index.html"
	end

	begin
		displayFile = File.open(filename, 'r')
		content = displayFile.read()
		session.print(content)
	rescue Errno::ENOENT
		session.print("File not found")
	end
	session.close

end







