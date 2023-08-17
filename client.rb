require 'socket'

def main
  host = '127.0.0.1'
  port = 12345

  client_socket = TCPSocket.new(host, port)

  loop do
    print "Enter a message: "
    message = gets.chomp
    client_socket.puts(message)
    break if message.downcase == 'exit'
  end

  client_socket.close
end

main if __FILE__ == $PROGRAM_NAME