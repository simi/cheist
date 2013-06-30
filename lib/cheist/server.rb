class Cheist::Server
  attr_accessor :version, :name, :map, :mod, :game_name,
    :players, :max_players, :server_id

  def to_hash
    {
      version: version,
      name: name,
      map: map,
      mod: mod,
      game_name: game_name,
      players: players,
      max_players: max_players
    }
  end
end
