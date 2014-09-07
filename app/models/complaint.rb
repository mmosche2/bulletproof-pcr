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

  def self.search(search)
    if search.present?
      year = Time.now.strftime("%Y")
      joins(:customer).where("complaints.summary LIKE :search
            OR complaints.status LIKE :search
            OR customers.email LIKE :search
            OR CAST(complaints.id AS TEXT) LIKE :search",
            {:search => "%#{search}%"})
    else
      scoped
    end
  end

  private

  def send_adverse_reaction_email
    UserMailer.notify_of_adverse_reaction(self.id).deliver
  end

end
