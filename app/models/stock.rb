class Stock < ApplicationRecord

	def self.find_by_sticker(ticker_symbol)
		where(ticker: ticker_symbol).first
		
	end
   
  def self.new_form_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nill unless looked_up_stock.name

    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end
  
  def price
  	closing_price = StockQuote::Stock.quote(ticker).close
  	return "#{closing_price}" if closing_price

  	opening_price = StockQuote::Stock.quote(ticker).open
  	return "#{opening_price}" if opening_price
  	'Unavailable'
  end  



end
