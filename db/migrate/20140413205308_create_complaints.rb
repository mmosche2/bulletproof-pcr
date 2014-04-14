class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.datetime :received_date
      t.references :user, index: true
      t.references :customer, index: true
      t.string :order_number
      t.text :immediate_response
      t.boolean :adverse_reaction
      t.text :summary
      t.text :correspondence_history

      t.timestamps
    end
  end
end
