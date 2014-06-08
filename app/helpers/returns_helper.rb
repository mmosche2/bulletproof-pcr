module ReturnsHelper

  def default_return_date
    if @return.new_record?
      Date.today.strftime("%B %d, %Y")
    else
      @return.originating_date.strftime("%B %d, %Y") if @return.originating_date
    end
  end


end
