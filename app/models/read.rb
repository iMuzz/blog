class Read < ActiveRecord::Base
  belongs_to :book

  validates_uniqueness_of :book_id
  validates_presence_of :book_id, :stars

  after_create :removeFromCurrentlyReading

  def self.books
    self.all.map { |read| read.book }
  end

  private

  def removeFromCurrentlyReading
    book = CurrentReading.find_by(id: self.book_id)
    if book.nil? != true
      book.destroy
    end
  end
end
