module Cheist::Parser
  def self.parse(response)
    server = Cheist::Server.new

    # trim first 4 null bytes
    response = response[4..-1]

    # header
    header = response.slice!(0)

    # protocol version
    version = response.slice!(0)
    server.version = version.unpack("C")[0]

    # name
    server.name = self.next_string(response)

    # map
    server.map = self.next_string(response)

    # mod
    server.mod = self.next_string(response)

    # game_name
    server.game_name = self.next_string(response)

    # ID
    server.server_id = self.next_string(response)

    # players
    players = response.slice!(0)
    server.players = players.unpack("C")[0]

    # max players
    max_players = response.slice!(0)
    server.max_players = max_players.unpack("C")[0]
    return server

  rescue
    raise Cheist::InvalidResponse
  end


  def self.next_string(string)
    result = ""
    while char = string.slice!(0) do
      break if char == "\x00"
      result << char
    end
    return result
  end
end
