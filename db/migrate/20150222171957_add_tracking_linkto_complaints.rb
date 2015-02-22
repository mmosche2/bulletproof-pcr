class AddTrackingLinktoComplaints < ActiveRecord::Migration
  def change
  	add_column :complaints, :tracking_link, :string
  end
end
