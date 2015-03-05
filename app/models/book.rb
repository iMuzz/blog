class Book < ActiveRecord::Base
  include GoodReadsFetcher

  has_one :read
  validates_uniqueness_of :title, scope: :author
  validates_presence_of :title, :author

  after_create :getImage

  def self.updateGoodReads
    Book.connection
    updateBooks
  end
  
  private

  def getImage
    books = GoogleBooks.search(self.title, {api_key: ENV['GOOGlE_KEY']})
    self.image = books.first.image_link(zoom: 1)
    self.save
  end
end
