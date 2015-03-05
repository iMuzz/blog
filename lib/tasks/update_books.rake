namespace :fetch_books do

  task goodreads: :environment do
    Book.updateGoodReads
  end
end
