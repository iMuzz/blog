class Book < ActiveRecord::Base
  validates_uniqueness_of :title, scope: :author
  validates_presence_of :title, :author, :image
end
