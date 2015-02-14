class Book < ActiveRecord::Base
  validates_uniqueness_of :title, scope: :author
  validates_presence_of :title, :author

  after_create :get_image

  private
  def get_image
    books = GoogleBooks.search(self.title, {api_key: ENV['GOOGlE_KEY']})
    self.image = books.first.image_link(zoom: 1)
    self.save
  end
end
