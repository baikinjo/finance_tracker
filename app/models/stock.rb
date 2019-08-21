# frozen_string_literal: true

class Stock < ApplicationRecord
  def self.new_from_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: 'pk_ba8c7277a08344708e058db8c73d83c3')
    looked_up_stock = client.quote(ticker_symbol)
    new(name: looked_up_stock.company_name,
        ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
  rescue Exception => e
    nil
  end
end
