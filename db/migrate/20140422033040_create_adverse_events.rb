class CreateAdverseEvents < ActiveRecord::Migration
  def change
    create_table :adverse_events do |t|
      t.datetime :origination_date
      t.references :user, index: true
      t.references :complaint, index: true
      t.datetime :date_of_event
      t.integer :age
      t.string :gender
      t.integer :weight
      t.text :event_description
      t.text :customer_feeling
      t.string :attending_health_professional
      t.boolean :hospitalized
      t.string :hospital_location
      t.text :relevant_tests
      t.text :other_relevant_history
      t.string :frequency
      t.string :usage
      t.string :timing
      t.string :therapy_dates
      t.boolean :abated_after_use_stopped
      t.boolean :reappeared_after_reintroduced
      t.text :previous_usage_history
      t.text :customer_usage_reason
      t.text :other_therapies

      t.timestamps
    end
  end
end
