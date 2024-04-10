class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :address_prefecture
      t.string :address_city
      t.integer :distance
      t.integer :price
      t.timestamps
    end
  end
end
