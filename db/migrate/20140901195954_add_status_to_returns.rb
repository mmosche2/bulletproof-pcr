class AddStatusToReturns < ActiveRecord::Migration
  def change
    add_column :returns, :status, :string
    add_column :returns, :type, :string
  end
end
