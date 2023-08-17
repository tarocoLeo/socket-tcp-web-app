require 'socket'

def handle_client(client_socket)
  loop do
    begin
      message = client_socket.recv(1024).chomp
      break if message.empty?
      puts "Received message: #{message}"
      # aqui vai a lógica pra enviar a mensagem para todos os clientes conectados
      # por meio de uma lista de sockets de clientes.
    rescue => e
      puts "Error: #{e}"
      break
    end
  end

  client_socket.close
end

def main
  host = '0.0.0.0'
  port = 12345

  server_socket = TCPServer.new(host, port)
  puts "Server listening on #{host}:#{port}"

  loop do
    client_socket = server_socket.accept
    client_thread = Thread.new { handle_client(client_socket) }
  end
end

main if __FILE__ == $PROGRAM_NAME