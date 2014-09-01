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


  def ra_number
    year = Time.now.strftime("%Y")
    return "#{year}-#{"%03d" % id}-R"
  end

  def status
    if !product_condition_entered?
      status = "Pending Warehouse"
    elsif !discard_qc_approval
      status = "Pending QC Approval to Discard"
    elsif !discard_management_approval
      status = "Pending Management Approval to Discard"
    elsif !discard_completed
      status = "Pending Discard"
    elsif !discard_witnessed
      status = "Pending Discard Witness"
    else
      status = "Closed."
    end
    return status
  end

  def product_condition_entered?
    faulty_products.each do |faulty_product|
      return false if faulty_product.condition.blank?
    end
    return true
  end

end
