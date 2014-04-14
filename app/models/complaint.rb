class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :faulty_products

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :faulty_products, allow_destroy: true


  def status
    return "pending"
  end

end
