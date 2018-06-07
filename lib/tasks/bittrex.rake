namespace :bittrex do
  desc "get ticker value every 1 minute"
  task ticker: :environment do
    puts Time.now
    ticker_value = Bittrex::Quote.current('BTC-ETH')
    ticker = Ticker.new
    ticker.ask = ticker_value.ask
    ticker.bid = ticker_value.bid
    ticker.last = ticker_value.last
    ticker.market = ticker_value.market
    ticker.save
    puts ticker.inspect
    puts ticker_value.inspect
  end

end
