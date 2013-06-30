require 'spec_helper'

describe Cheist do
  let(:query) {Cheist.query("127.0.0.1", 27015)}
  let(:response) {
    ["\xFF\xFF\xFF\xFFI0retro server\x00de_inferno\x00cstrike\x00Counter-Strike\x00\n\x00\x00\x10\x00dl\x00\x001.1.2.6/Stdio\x00\x91\x88i\x00H\xA9\xB8\xA1\r@\x01\n\x00\x00\x00\x00\x00\x00\x00"]
  }

  context "::query" do
    it "returns Cheist::Server" do
      UDPSocket.any_instance.should_receive(:recvfrom).and_return(response)
      expect(query.class).to eq(Cheist::Server)
    end
  end
end
