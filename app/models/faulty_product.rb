class FaultyProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :complaint
  belongs_to :return

  monetize :credit_amount_in_pennies, as: :credit_amount, :allow_nil => true

end
