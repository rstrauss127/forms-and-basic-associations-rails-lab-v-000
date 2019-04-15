class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def genre_name=(genre)
    self.genre_name = Genre.find_or_create_by(genre_name: genre)
  end
end
