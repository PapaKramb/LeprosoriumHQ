class CreateComments < ActiveRecord::Migration[6.0]
  def change
  	create_table :Comments do |t|
  		t.date :created_date
  		t.text :content
  		t.text :post_id

  		t.timestamps
  	end
  end
end
