class ExchangesController < ApplicationController
  def bittrex
    @data =  Ticker.filter_data_by_minute.reverse
    # @data = @data.reverse

    indicator_data = Indicators::Data.new(Ticker.last_data)
    @rsi    = indicator_data.calc(:type => :rsi, :params => 14).output.reverse
    @sma    = indicator_data.calc(:type => :sma, :params => 5).output
    @ema    = indicator_data.calc(:type => :ema, :params => 5).output
    # @macd   = indicator_data.calc(:type => :macd, :params => [12, 26, 9]).output
    @bb     = indicator_data.calc(:type => :bb, :params => [15, 3]).output
  end
end
