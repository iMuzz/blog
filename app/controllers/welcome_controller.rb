class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def home
    update_books
    @currently_reading = Book.all
    render "books"
  end
end