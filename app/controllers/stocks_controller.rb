class StocksController < ApplicationController
	def search
		if params[:stock]
			@stock = Stock.find_by_sticker(params[:stock])
			@stock ||= Stock.new_form_lookup(params[:stock])
		end
		
		if @stock
		  render partial: 'lookup'
		else
		  render status: :not_found, nothing: true  
		end  	
	end
	
	
end