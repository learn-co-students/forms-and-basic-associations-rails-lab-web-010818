class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
    self.save
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents=(content)
    content.each do |c|
      if !c.empty?
        self.notes << Note.find_or_create_by(content: c)
      end
    end
  end

  def note_contents
    self.notes.collect {|n| n.content}
  end

end
