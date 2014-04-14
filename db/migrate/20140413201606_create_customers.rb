class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end

    add_index :customers, :email
    add_index :customers, :name
  end
end
