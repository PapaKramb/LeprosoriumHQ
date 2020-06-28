class CreateComments < ActiveRecord::Migration[6.0]
  def change
  	create_table :Comments do |t|
  		t.belongs_to :post
  		t.datetime :created_date
  		t.text :content
  		t.text :post_id

  		t.timestamps
  	end
  end
end
