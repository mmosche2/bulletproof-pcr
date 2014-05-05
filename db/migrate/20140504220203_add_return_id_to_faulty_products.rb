class AddReturnIdToFaultyProducts < ActiveRecord::Migration
  def change
    add_reference :faulty_products, :return, index: true
  end
end
