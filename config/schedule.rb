every :day, :at => '2:45pm' do
  rake 'fetch_books:goodreads', :environment => 'development', :output => 'log/cron.log'
end

every 1.minute do 
  rake "fetch_books:goodreads", :environment => 'development', :output => 'log/cron.log'
end