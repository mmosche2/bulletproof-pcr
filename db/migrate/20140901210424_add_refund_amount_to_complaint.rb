class AddRefundAmountToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :refund_amount, :integer
    add_column :complaints, :return_quantity, :integer
  end
end
