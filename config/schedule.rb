every 1.minute do 
  rake "fetch_books:goodreads", :environment => 'development', :output => 'log/cron.log'
end

every 1.minute do 
  rake "fetch_books:goodreads", :environment => 'production', :output => 'log/cron.log'
end