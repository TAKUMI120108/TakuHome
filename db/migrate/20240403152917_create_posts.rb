class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :address
      t.text :comment
      t.integer :evaluation
      t.integer :customer_id
       t.string :star
      t.timestamps
    end
  end
end
