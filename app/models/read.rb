class Read < ActiveRecord::Base
  belongs_to :book

  validates_uniqueness_of :book_id
  validates_presence_of :book_id, :stars

  after_create :remove_from_currently_reading

  def self.books
    self.all.map { |read| read.book }
  end

  def self.books_by_notes
    self.includes(:book).sort_by {|read| read.notes}.reverse
  end
  
  private

  def remove_from_currently_reading
    book = CurrentReading.find_by(id: self.book_id)
    if book.nil? != true
      book.destroy
    end
  end
end
