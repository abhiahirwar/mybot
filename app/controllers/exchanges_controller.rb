class ExchangesController < ApplicationController
  def bittrex
    @ticker = Bittrex::Quote.current('BTC-ETH')
  end
end
