require './music_fun'
require 'yaml'

describe MusicFun do
  let(:music){ YAML::load(File.read('./music.yaml')) }
  let(:data){ MusicFun.new music }

  it "has music" do
    data.music.should == music
  end

  it "has artists (accesses music by key)" do
    data['artists'].should == music['artists']
  end

  it "can last key (artists) from genres" do
    data["genres"].last["artists"].first["albums"].first["tracks"].last["name"].should == "But Not For Me"
  end

  it "can access artists by genres" do
    data.genres.last.artists.first.albums.first.tracks.last.name.should == "But Not For Me"
  end
end
