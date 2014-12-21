class AddPcNumberToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :pc_number, :string
  end
end
