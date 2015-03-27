class AddDeletedAtToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :deleted_at, :timestamp
    add_column :returns, :deleted_at, :timestamp
  end
end
