class CreateComplaintImages < ActiveRecord::Migration
  def change
    create_table :complaint_images do |t|
    	t.integer :complaint_id
      t.attachment :image
      t.timestamps
    end
  end
end
