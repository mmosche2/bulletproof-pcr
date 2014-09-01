class AddProductReceivedToReturns < ActiveRecord::Migration
  def change
    add_column :faulty_products, :quantity_received, :integer
    rename_column :faulty_products, :quantity, :quantity_reported
  end
end
