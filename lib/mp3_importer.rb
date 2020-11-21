
class MP3Importer
    attr_accessor :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if { |file|  !file.end_with?(".mp3")}
    end
        
    def import
        self.files.each { |filename| Song.new_by_filename(filename) }
    end

end