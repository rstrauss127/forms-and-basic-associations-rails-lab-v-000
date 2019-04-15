class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    g = Genre.find_by(name: name)
    self.genre = g
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |n|
      self.notes.build(content: n).save if n.length > 0
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
