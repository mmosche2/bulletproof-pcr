class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :faulty_products
  has_many :complaint_images
  has_one :adverse_event
  has_one :return

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :faulty_products, allow_destroy: true
  accepts_nested_attributes_for :complaint_images, :allow_destroy => true

  after_create :send_adverse_reaction_email, if: ->(complaint) {complaint.adverse_reaction?}

  STATUSES = ["open", "pdf", "closed"]

  default_scope where(:deleted_at => nil)

  def self.deleted
    self.unscoped.where('deleted_at IS NOT NULL')
  end


  def self.search(search)
    if search.present?
      year = Time.now.strftime("%Y")
      joins(:customer).where("lower(complaints.summary) LIKE :search
            OR lower(complaints.status) LIKE :search
            OR lower(complaints.pc_number) LIKE :search
            OR lower(customers.email) LIKE :search
            OR lower(customers.name) LIKE :search
            OR CAST(complaints.id AS TEXT) LIKE :search",
            {:search => "%#{search.downcase}%"})
    else
      scoped
    end
  end

  private

  def send_adverse_reaction_email
    UserMailer.notify_of_adverse_reaction(self.id).deliver
  end

end
