module ComplaintsHelper

  def default_received_date
    @complaint.new_record? ? Date.today.strftime("%B %d, %Y") : @complaint.received_date.strftime("%B %d, %Y")
  end

end
