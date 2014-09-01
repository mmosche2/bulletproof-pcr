class CreateContactAttempts < ActiveRecord::Migration
  def change
    create_table :contact_attempts do |t|
      t.references :adverse_events, index: true
      t.references :user, index: true
      t.text :note
    end
  end
end
