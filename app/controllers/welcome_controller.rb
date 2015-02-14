class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def home
    updateBooks
    @currently_reading = Book.all
    render "books"
  end
end