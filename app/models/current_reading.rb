class CurrentReading < ActiveRecord::Base
  belongs_to :book
  validates_uniqueness_of :book_id
  validates_presence_of :book_id

  def self.books
    self.all.map { |currently_reading| currently_reading.book  }
  end
end
