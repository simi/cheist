require 'spec_helper'

describe Cheist::Server do
  let(:server) {Cheist::Server.new}
  let(:keys) {[:version, :name, :map, :mod,
               :game_name, :players, :max_players]}

  context "#to_hash" do
    it "returns hash with all informations" do
      expect(server.to_hash.keys).to eq(keys)
    end
  end
end
