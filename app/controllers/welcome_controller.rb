class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def home
    # @currently_reading = Book.all
    render "books"
  end
end