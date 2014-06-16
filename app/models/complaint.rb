class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :faulty_products
  has_one :adverse_event
  has_one :return

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :faulty_products, allow_destroy: true

  STATUSES = ["open", "closed"]

  def pc_number
    year = Time.now.strftime("%y")
    return "#{year}-#{id}-PC"
  end

end
