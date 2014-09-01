class ChangeRefundAmountTypeInComplaint < ActiveRecord::Migration
  def change
    change_column :complaints, :refund_amount, :decimal
  end
end
