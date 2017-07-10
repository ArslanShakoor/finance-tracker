class CreateTableFrindships < ActiveRecord::Migration[5.1]
  def change
  	drop_table :friendships 
    create_table :friendships do |t|
    	t.belongs_to :user 
  	  t.belongs_to :friend , class: 'User'
    end
  end
end
