class WelcomeController < ApplicationController
  include WelcomeHelper

  def about_me
    render "about_me"
  end

  def home
    # updateBooks
    @currently_reading = CurrentReading.books
    @finished_reading = Read.books_by_notes
    render "books"
  end
end