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
    response = if select([u], nil, nil, 2)
             u.recvfrom(65536)
           end
    u.close
    if response
      server = Cheist::Parser.parse(response[0])
      return server
    else
      raise "Timeout"
    end
  end
end
