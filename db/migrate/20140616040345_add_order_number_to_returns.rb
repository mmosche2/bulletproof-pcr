class AddOrderNumberToReturns < ActiveRecord::Migration
  def change
    add_column :returns, :order_number, :string
  end
end
