class ContactAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :adverse_event

end
