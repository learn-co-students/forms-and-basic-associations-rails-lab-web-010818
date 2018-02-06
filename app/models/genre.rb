class Genre < ActiveRecord::Base
  has_many :songs

  def genre_name=(id)
    Genre.find_or_create_by(id: name).name
  end

  def genre_name
    if !self.nil?
      self.name
    end
  end

end
