class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :price
      t.string :serial_number

      t.timestamps
    end
  end
end
