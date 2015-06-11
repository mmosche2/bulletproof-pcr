class UserMailer < ActionMailer::Base

  def notify_of_adverse_reaction(complaint_id)
    recipients = User.where(notify_for_aer: true).pluck(:email)
    @complaint = Complaint.find(complaint_id)
    mail(to:     recipients,
        from:    "qc.app@bulletproof.com",
        subject: "New Adverse Reaction Report")
  end

end
