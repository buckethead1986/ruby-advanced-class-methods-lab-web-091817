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
    song = self.new
    # @@all << song
    self.all << song #should work thew same as above
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name) #no need to repeat code. use the above new_by_name method called on the instance.
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    parsed = name.split(" - ")
    song = self.new_by_name(parsed[1].chomp(".mp3"))
    song.artist_name = parsed[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    self.all << song
    song
   end

   def self.destroy_all
     @@all.clear
   end

end
