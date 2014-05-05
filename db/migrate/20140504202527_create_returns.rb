class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.datetime :originating_date
      t.references :customer, index: true
      t.references :user, index: true
      t.references :complaint, index: true
      t.integer :discard_management_approval_by
      t.datetime :discard_management_approval_date
      t.integer :discard_qc_approval_by
      t.datetime :discard_qc_approval_date
      t.string :method_of_disposal
      t.integer :discard_completed_by
      t.datetime :discard_completed_date
      t.integer :discard_witnessed_by
      t.datetime :discard_witnessed_date

      t.timestamps
    end
  end
end
