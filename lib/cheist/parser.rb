module Cheist::Parser
  SOURCE = 1
  GOLDSOURCE = 2

  def self.parse(response)
    # trim first 4 null bytes
    response = response[4..-1]

    # header
    header = response.slice!(0)

    server = case header
               when 'm' then self.parse_response(response, GOLDSOURCE)
               when 'I' then self.parse_response(response, SOURCE)
               else raise Cheist::InvalidResponse
             end

    return server
  end

  def self.parse_response(response, version)
    server = Cheist::Server.new

    if version == SOURCE
      # protocol version
      proto_version = response.slice!(0)
      server.version = proto_version.unpack("C")[0]
    end

    if version == GOLDSOURCE
      # address
      address = self.next_string(response)
    end

    # name
    server.name = self.next_string(response)

    # map
    server.map = self.next_string(response)

    # mod
    server.mod = self.next_string(response)

    # game_name
    server.game_name = self.next_string(response)

    if version == SOURCE
      # ID
      server_id = self.next_string(response)
    end

    # players
    players = response.slice!(0)
    server.players = players.unpack("C")[0]

    # max players
    max_players = response.slice!(0)
    server.max_players = max_players.unpack("C")[0]

    if version == GOLDSOURCE
      # protocol version
      proto_version = response.slice!(0)
      server.version = proto_version.unpack("C")[0]
    end
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
