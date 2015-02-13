@client = Goodreads::Client.new(
  :api_key => ENV['API_KEY'],
  :api_secret =>  ENV['SECRET_KEY']
)