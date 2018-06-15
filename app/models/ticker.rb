class Ticker < ApplicationRecord
  after_save { logger.info( 'New contact saved!' ) }

  def change(interval = 15)
     last.to_f - Ticker.find_by_id(self.id.to_i - interval).try(:last).to_f 
  end

  def change_percentage
     ( change / last.to_f ) * 100
  end

  def self.filter_data_by_minute(interval = 15)
    all.reject { |tick| tick.created_at.min % interval != 0 }
  end

  def self.last_data(interval = 15)
    data = filter_data_by_minute(interval)
    data.pluck(:last).map(&:to_f)
  end

  def rsi_current
    last_data = Ticker.last_data
    if last_data.count > 15
      indicator_data = Indicators::Data.new(last_data)
      indicator_data.calc(:type => :rsi, :params => 14).output.last(4)
    else 
      return 0
    end
  end
end
