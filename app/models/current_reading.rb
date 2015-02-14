class CurrentReading < ActiveRecord::Base
  validates_uniqueness_of :book_id
  validates_presence_of :book_id
end
