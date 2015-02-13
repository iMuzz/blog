module WelcomeHelper
  def update
    current_reading = GoodReadsClient.shelf("17272747", "currently-reading")
    current_reading[:books].each do |book|
      Book.create(title: book[:book][:title], author: book[:book][:authors][:author][:name], image: book[:book][:image_url])
    end
  end
end
