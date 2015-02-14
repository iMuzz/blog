module WelcomeHelper
  def update_books
    update_currently_reading
    update_read
  end

  def update_currently_reading
    current_reading = GoodReadsClient.shelf("17272747", "currently-reading")
    current_reading[:books].each do |book|
      b = Book.create(title: book[:book][:title], author: book[:book][:authors][:author][:name])
      CurrentReading.create(book_id: b.id)
    end
  end

  def update_read
    read = GoodReadsClient.shelf("17272747", "read", {per_page: 100})
    binding.pry
     read[:books].each do |book|
      b = Book.create(title: book[:book][:title], author: book[:book][:authors][:author][:name])
      Read.create(book_id: b.id)
    end
  end
end
