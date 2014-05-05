module ReturnsHelper

  def default_return_date
    @return.new_record? ? Date.today.strftime("%B %d, %Y") : @return.originating_date.strftime("%B %d, %Y")
  end


end
