class Return < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  belongs_to :complaint
  has_many :faulty_products

  belongs_to :discard_qc_approval, :foreign_key => :discard_qc_approval_by, :class_name => "User"
  belongs_to :discard_management_approval, :foreign_key => :discard_management_approval_by, :class_name => "User"
  belongs_to :discard_completed, :foreign_key => :discard_completed_by, :class_name => "User"
  belongs_to :discard_witnessed, :foreign_key => :discard_witnessed_by, :class_name => "User"

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :faulty_products, allow_destroy: true

  STATUSES = ["open", "pdf", "closed"]
  TYPES = ["CC: Customer complaint", "RS: Return to sender", "WS: Warehouse", "CRDS: Customer Return Dietary Supplement", "CRF: Customer Return Food"]
  CONDITIONS = ["good", "bad"]

  def ra_number
    year = Time.now.strftime("%Y")
    return "#{year}-#{"%03d" % id}-R"
  end

  def product_condition_entered?
    faulty_products.each do |faulty_product|
      return false if faulty_product.condition.blank?
    end
    return true
  end

  def self.search(search)
    if search.present?
      joins(:customer).where("lower(returns.status) LIKE :search
          OR lower(customers.email) LIKE :search
          OR lower(customers.name) LIKE :search
          OR CAST(returns.id AS TEXT) LIKE :search", {:search => "%#{search.downcase}%"})
    else
      scoped
    end
  end

end
