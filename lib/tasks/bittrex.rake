namespace :bittrex do
  desc "get ticker value every 1 minute"
  task ticker: :environment do
    puts Time.now
    ticker_value = Bittrex::Quote.current('ETH-NEO')
    ticker = Ticker.new
    ticker.ask = ticker_value.ask
    ticker.bid = ticker_value.bid
    ticker.last = ticker_value.last
    ticker.market = ticker_value.market
    ticker.save
  end

end
