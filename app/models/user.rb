class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks   

  def full_name
  	return "#{first_name}  #{last_name}".strip if (first_name || last_name)
  	"Anonymous"
  	
  end

  def can_add_stock?(ticker_Symbol)
  	under_stock_limit? && !stock_already_added?(ticker_Symbol);
  end

  def under_stock_limit?
  	user_stocks.count < 10
  end	

  def stock_already_added?(ticker_Symbol)
  	stock = Stock.find_by_ticker(ticker_Symbol)
  	return false unless stock
  	stock.id
  	user_stocks.where(stock_id: stock.id).first
  end
end
