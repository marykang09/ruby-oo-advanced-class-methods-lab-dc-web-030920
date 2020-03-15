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
  #instantiates and saves the song, returns new song created
    created_song = Song.new
    created_song.save
    created_song
  end

  def self.new_by_name(song_name)
  #instantiates a song with a name property
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
  #instantiates and saves a song with a name property
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
  #can find a song present in @@all by name
  #returns falsey when a song name is not present in @@all
    self.all.find do |song| 
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
  #invokes .find_by_name and .create_by_name
  #returns existing Song object when provided title
  #creates new Song object if not existent
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
        
  def self.alphabetical
  #returns all the song instances in alphbet order by song name
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
  #initializes a song and artist_name based on filename
    file_contents = filename.split(" - ")
    artist_name = file_contents[0]
    song_name = file_contents[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
  #initializes and saves song and artistname based on filename
    file_contents = filename.split(" - ")
    artist_name = file_contents[0]
    song_name = file_contents[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
  #clears all the song instances from the @@all array
  self.all.clear
  end

end
