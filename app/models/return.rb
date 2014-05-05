class Return < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  belongs_to :complaint
  has_many :faulty_products

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :faulty_products, allow_destroy: true

end
