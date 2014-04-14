class Product < ActiveRecord::Base
  has_many :faulty_products
end
