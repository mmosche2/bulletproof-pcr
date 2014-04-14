class CreateFaultyProducts < ActiveRecord::Migration
  def change
    create_table :faulty_products do |t|
      t.references :product, index: true
      t.references :complaint, index: true
      t.integer :quantity
      t.integer :size_count
      t.string :lot
      t.datetime :expiration

      t.timestamps
    end
  end
end
