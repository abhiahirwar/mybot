class Ticker < ApplicationRecord
  def change
     last.to_f - Ticker.find_by_id(self.id.to_i - 1).try(:last).to_f 
  end

  def signal
    (last.to_f - Ticker.find_by_id(self.id.to_i - 1).try(:last).to_f ) >= 0 ? true : false
  end
end
