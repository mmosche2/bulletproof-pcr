class Product < ActiveRecord::Base
  has_many :faulty_products

  default_scope where(:deleted_at => nil)

  def self.deleted
    self.unscoped.where('deleted_at IS NOT NULL')
  end

end
