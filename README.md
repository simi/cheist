# Cheist [![Build Status](https://travis-ci.org/simi/cheist.png?branch=master)](https://travis-ci.org/simi/cheist)

Query your Counter-Strike (not only) servers from ruby!

Made with https://developer.valvesoftware.com/wiki/Server_queries.

## Installation

Add this line to your application's Gemfile:

    gem 'cheist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cheist

## Usage

```ruby
server = Cheist.query("127.0.0.1", 27015)
server.version #=> 48 (server protocol version)
server.name #=> "server name"
server.map #=> "de_dust2"
server.mod #=> "cstrike"
server.game_name #=> "Counter-Strike"
server.players #=> 5 (playing players)
server.max_players #=> 16 (server maximum players limit)
server.to_hash #=> {version: 48, name: "server name", ...}

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
