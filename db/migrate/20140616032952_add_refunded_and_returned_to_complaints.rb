class AddRefundedAndReturnedToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :is_returned, :boolean
    add_column :complaints, :is_refunded, :boolean
  end
end
