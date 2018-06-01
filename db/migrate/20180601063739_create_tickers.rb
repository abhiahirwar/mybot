class CreateTickers < ActiveRecord::Migration[5.2]
  def change
    create_table :tickers do |t|
      t.string :ask
      t.string :bid
      t.string :last
      t.string :market

      t.timestamps
    end
  end
end
