class RenameAdverseEventIdInContactAttempts < ActiveRecord::Migration
  def change
    rename_column :contact_attempts, :adverse_events_id, :adverse_event_id
  end
end
