class AddRaNumberToReturns < ActiveRecord::Migration
  def change
    add_column :returns, :ra_number, :string
  end
end
