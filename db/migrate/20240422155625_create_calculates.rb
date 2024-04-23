class CreateCalculates < ActiveRecord::Migration[6.1]
  def change
    create_table :calculates do |t|
      t.integer :customer_id
      t.integer :home_pay
      t.integer :other_payment_amount
      t.integer :rent
      t.integer :security_deposit
      t.integer :key_money
      t.integer :management_fee
      t.integer :guarantee_charge
      t.timestamps
    end
  end
end
