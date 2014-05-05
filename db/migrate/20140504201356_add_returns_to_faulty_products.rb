class AddReturnsToFaultyProducts < ActiveRecord::Migration
  def change
    add_column :faulty_products, :returned, :boolean
    add_column :faulty_products, :reason_for_return, :text
    add_column :faulty_products, :credit_amount_in_pennies, :integer
    add_column :faulty_products, :credit_issued_date, :datetime
    add_column :faulty_products, :return_auth_num, :integer
    add_column :faulty_products, :condition, :text
    add_column :faulty_products, :quarantined, :boolean
    add_column :faulty_products, :quarantined_area_by, :integer
    add_column :faulty_products, :quarantined_area_date, :datetime
    add_column :faulty_products, :quarantined_sticker_by, :integer
    add_column :faulty_products, :quarantined_sticker_date, :datetime
  end
end
