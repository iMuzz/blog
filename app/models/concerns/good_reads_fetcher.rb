module GoodReadsFetcher

  extend ActiveSupport::Concern
  
  module ClassMethods    
    def updateBooks
      updateCurrentlyReading
      updateRead
    end

    def updateCurrentlyReading
      current_reading = GoodReadsClient.shelf("17272747", "currently-reading")
      current_reading[:books].each do |book|
        b = Book.create(title: book[:book][:title], author: book[:book][:authors][:author][:name], isbn: book[:book][:isbn13])
        CurrentReading.create(book_id: b.id)
      end
    end

    def updateRead
      read = GoodReadsClient.shelf("17272747", "read", {per_page: 100})
       read[:books].each do |book|
        b = Book.find_or_create_by(title: book[:book][:title], author: book[:book][:authors][:author][:name])
        b.rating = book[:rating]
        b.save
        Read.create(book_id: b.id, stars: book[:rating])
      end
    end
  end
end
