class Customer < ActiveRecord::Base
  has_many :complaints
  has_many :returns
end
