require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  #
  # def initialize
  # end

  def self.all
    @@all
  end

  def initialize(name=nil)
    self.name = name
  end


  def self.save (newest_song)
    self.all << newest_song
    #self
  end

  def self.create
    newest_song = self.new
    self.save (newest_song)
    newest_song
  end


  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    newest_song = self.new(name)
    self.save (newest_song)
    newest_song
  end

  def self.find_by_name(name)
    check_val = false
    self.all.each do |song|
      #binding.pry
      if song.name == name
        return song
        check_val = true
        break
      end
    end
    if check_val == false
      return nil
    end
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
    split_file = filename.split(' - ')
    new_song = self.find_or_create_by_name(split_file[1].chomp('.mp3'))
    #binding.pry
    new_song.artist_name = split_file[0]
    self.save (new_song)
    return new_song
  end

  def self.create_from_filename(filename)
    split_file = filename.split(' - ')
    new_song = self.find_or_create_by_name(split_file[1].chomp('.mp3'))
    #binding.pry
    new_song.artist_name = split_file[0]
    return new_song
  end

  def self.destroy_all
    @@all = []
  end
end

#binding.pry
