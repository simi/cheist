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
      server.version = self.next_byte(response)
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
    server.players = self.next_byte(response)

    # max players
    server.max_players = self.next_byte(response)

    if version == GOLDSOURCE
      # protocol version
      server.version = self.next_byte(response)
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

  def self.next_byte(string)
    result = string.slice!(0)
    result = result.unpack("C")[0]
    return result
  end
end
