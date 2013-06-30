require 'socket'
require "cheist/version"
require "cheist/parser"
require "cheist/server"

module Cheist
  class InvalidResponse < Exception; end

  def self.query(ip, port)
    query = "TSource Engine Query"
    cmd = "\377\377\377\377#{query}\0"

    u = UDPSocket.open
    u.send(cmd , 0, ip, port)
    response = u.recvfrom(65536)[0]
    server = Cheist::Parser.parse(response)
    return server
  end
end
