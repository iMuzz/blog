class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def home
    update
    @currently_reading = Book.all
    render "books"
  end
end