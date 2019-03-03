require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    #Because of this function, there is no def initialize . This method intializes an instance and saves the new instance
    song = Song.new # to check: Its not working when ---new_song = self.new
    song.save 
    song
  end
  def self.new_by_name(name)
     new_song= self.new  
     new_song.name = name
   
     new_song
  end
  def self.create_by_name(name)
    new_song = self.create 
    new_song.name = name 
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
      @@all.find {|song| song.name==name}
  end

  def self.find_or_create_by_name(given_name)
      self.find_by_name(given_name) || self.create_by_name(given_name)
  end

  def self.alphabetical
    (self.all.sort_by{|song| song.name}).uniq
  end

  def self.new_from_filename(file_name)
     new_song = Song.new
     new_song.name =(file_name.split("- ")[1]).split('.')[0]
     new_song.artist_name = file_name.split[0]
     new_song
  end

  def self.create_from_filename(file_name)
     new_song = Song.new
     new_song.name =(file_name.split("- ")[1]).split('.')[0]
     new_song.artist_name = file_name.split[0]
     new_song.save
     new_song
  end

  def self.destroy_all
    #@@all = [] This works too. But lets use the .clear method as below
    self.all.clear
  end
end
