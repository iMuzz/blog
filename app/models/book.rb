class Book < ActiveRecord::Base
  has_one :read
  validates_uniqueness_of :title, scope: :author
  validates_presence_of :title, :author

  after_create :getImage

  private
  def getImage
    books = GoogleBooks.search(self.title, {api_key: ENV['GOOGlE_KEY']})
    self.image = books.first.image_link(zoom: 1)
    self.save
  end
end
