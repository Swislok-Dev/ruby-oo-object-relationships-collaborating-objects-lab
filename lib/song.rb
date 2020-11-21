require "pry"

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_name = filename.split(" - ")[1]
        song_artist = filename.split(" - ")[0]
        song = self.new(song_name)
        artist = Artist.find_or_create_by_name(song_artist)
        song.artist = artist 
        artist.add_song(song)
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
        artist.add_song(self)
    end

end