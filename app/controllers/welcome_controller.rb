class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def home
    # updateBooks
    @currently_reading = CurrentReading.books
    @finished_reading = Read.books
    render "books"
  end
end