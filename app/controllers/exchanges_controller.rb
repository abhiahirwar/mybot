class ExchangesController < ApplicationController
  def bittrex
    @data =  Ticker.order(created_at: :asc)
    @data =  @data.reject{ |model|  @data.index(model) % 1 != 0 }
    last =  @data.pluck(:last).map(&:to_f)

    indicator_data = Indicators::Data.new(last)
    @rsi    = indicator_data.calc(:type => :rsi, :params => 14).output
    @sma    = indicator_data.calc(:type => :sma, :params => 5).output
    @ema    = indicator_data.calc(:type => :ema, :params => 5).output
    @macd   = indicator_data.calc(:type => :macd, :params => [12, 26, 9]).output
    @bb     = indicator_data.calc(:type => :bb, :params => [15, 3]).output
  end
end
