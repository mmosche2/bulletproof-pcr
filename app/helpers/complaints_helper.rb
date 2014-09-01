module ComplaintsHelper

  def default_received_date
    @complaint.new_record? ? Date.today.strftime("%B %d, %Y") : @complaint.received_date.strftime("%B %d, %Y")
  end

  def format_date(date_obj)
    date_obj.nil? ? "" : date_obj.strftime("%B %d, %Y")
  end

  def edit_or_new_adverse_event
    @complaint.adverse_event || @complaint.build_adverse_event
  end

  def name_or_email(user)
    user.name.present? ? user.name : user.email
  end

end
