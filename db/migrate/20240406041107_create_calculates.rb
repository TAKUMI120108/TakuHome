class CreateCalculates < ActiveRecord::Migration[6.1]
  def change
    create_table :calcurates do |t|

      t.timestamps
    end
  end
end
