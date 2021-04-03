class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: 'Tpk_8d66ace1a3ad4e69854312fdf53d777a',
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    client.price(ticker_symbol)                              
  end  
end
