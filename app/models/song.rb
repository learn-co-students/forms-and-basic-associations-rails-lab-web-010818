class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

  def note_contents=(contents_array)
    contents_array.each do |content|
      if !content.empty?
        note = Note.create(content: content)
        self.notes << note
      end
    end
    self.notes
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

end
