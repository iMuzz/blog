class Read < ActiveRecord::Base
  validates_uniqueness_of :book_id
  validates_presence_of :book_id, :stars

  after_create :removeFromCurrentlyReading

  private

  def removeFromCurrentlyReading
    book = CurrentReading.find_by(id: self.book_id)
    book.destroy if not book
  end
end
