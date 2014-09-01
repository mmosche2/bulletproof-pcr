class RenameTypeToReturnType < ActiveRecord::Migration
  def change
    rename_column :returns, :type, :return_type
  end
end
