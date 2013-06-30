require 'spec_helper'

describe Cheist::Parser do
  let(:response) {
    "\xFF\xFF\xFF\xFFI0retro server\x00de_inferno\x00cstrike\x00Counter-Strike\x00\n\x00\x00\x10\x00dl\x00\x001.1.2.6/Stdio\x00\x91\x88i\x00H\xA9\xB8\xA1\r@\x01\n\x00\x00\x00\x00\x00\x00\x00"
  }
  let(:result) {Cheist::Parser.parse(response)}

  context "::parse" do
    it "raises when unexpected response is parsed" do
      expect{Cheist::Parser.parse("abc123")}.to raise_error(Cheist::InvalidResponse)
    end

    it "returns Cheist::Server class" do
      expect(result.class).to eq(Cheist::Server)
    end

    it "returns valid protocol version" do
      expect(result.version).to eq(48)
    end

    it "returns valid name" do
      expect(result.name).to eq("retro server")
    end

    it "returns valid map" do
      expect(result.map).to eq("de_inferno")
    end

    it "returns valid mod" do
      expect(result.mod).to eq("cstrike")
    end

    it "returns valid game name" do
      expect(result.game_name).to eq("Counter-Strike")
    end

    it "returns valid server ID" do
      expect(result.server_id).to eq("\n")
    end

    it "returns valid players count" do
      expect(result.players).to eq(0)
    end

    it "returns valid maximum players count" do
      expect(result.max_players).to eq(16)
    end
  end
end
