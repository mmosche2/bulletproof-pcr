class FaultyProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :complaint
end
