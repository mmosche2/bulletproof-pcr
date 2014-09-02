class AddAerNotificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notify_for_aer, :boolean
  end
end
