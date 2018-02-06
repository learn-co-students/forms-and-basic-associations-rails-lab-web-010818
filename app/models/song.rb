class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if !self.artist.nil?
      self.artist.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if !self.genre.nil?
      self.genre.name
    end
  end

  def note_contents=(note_contents) ## note_contents is an array of content strings
    note_contents.each do |n|
      if !n.empty?
        new_note = Note.create(content: n)
        self.notes << new_note
      end
    end
  end

  def note_contents ## Returns array of content strings
    self.notes.map { |n| n.content }
  end
end
