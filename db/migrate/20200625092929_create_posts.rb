class CreatePosts < ActiveRecord::Migration[6.0]
  def change
  	create_table :Posts do |t|
  		t.text :email
  		t.datetime :created_date
  		t.text :content

  		t.timestamps
  	end
  end
end
