
class Artist
    attr_accessor :name
    @@all = []

    def initialize(artist_name)
        @name = artist_name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song_name)
        @songs << song_name
    end

    def self.find_or_create_by_name(artist_name)
        self.all.detect { |artist| artist.name == artist_name } || Artist.new(artist_name)
    end

    def songs
        Song.all.each { |song| add_song(song) if song.artist == self}
        # Song.all.each do |song|
        #     if song.artist == self
        #         add_song(song)
        #     end
        # end
        @songs
    end

    def print_songs
        @songs.each { |song| puts song.name}
    end

end