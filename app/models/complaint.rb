class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :faulty_products
  has_one :adverse_event
  has_one :return

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :faulty_products, allow_destroy: true

  after_create :send_adverse_reaction_email, if: ->(complaint) {complaint.adverse_reaction?}

  STATUSES = ["open", "pdf", "closed"]

  def pc_number
    year = Time.now.strftime("%Y")
    return "#{year}-#{"%03d" % id}-PC"
  end

  private

  def send_adverse_reaction_email
    UserMailer.notify_of_adverse_reaction(self.id)
  end

end
