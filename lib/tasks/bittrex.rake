namespace :bittrex do
  desc "get ticker value every 1 minute"
  task ticker: :environment do
    puts Time.now
    ticker_value = Bittrex::Quote.current('BTC-ETH')
    puts ticker_value.inspect
  end

end
