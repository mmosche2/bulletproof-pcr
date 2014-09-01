class AddTimestampsToContactAttempts < ActiveRecord::Migration
  def change
    add_column :contact_attempts, :created_at, :datetime
    add_column :contact_attempts, :updated_at, :datetime
  end
end
