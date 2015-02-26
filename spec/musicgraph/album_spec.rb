module MusicGraph
  describe Album do

    it "exists" do
      expect(MusicGraph::Album)
    end

    describe "#search" do
      it "returns album name search results" do
        VCR.use_cassette("album", record: :new_episodes) do
          album_name = "either/or"
          albums = MusicGraph::Album.search(album_name)

          expect(albums).to_not be_empty
          expect(albums.first).to be_a Album
          expect(albums.first.title).to eql("Either/Or")
        end
      end
    end
  end
end
