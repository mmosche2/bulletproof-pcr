class AdverseEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :complaint
  has_many :contact_attempts

end
