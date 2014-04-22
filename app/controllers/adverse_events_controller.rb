class AdverseEventsController < ApplicationController
  before_action :authenticate_user!

  def create
    @adverse_event = AdverseEvent.new(adverse_event_params)
    if @adverse_event.save
      redirect_to complaint_path(@adverse_event.complaint)
    else
      render "new"
    end
  end

  def update
    @adverse_event = AdverseEvent.find(params[:id])

    if @adverse_event.update(adverse_event_params)
      redirect_to edit_complaint_path(@adverse_event)
    else
      render 'edit'
    end
  end

  def destroy
  end


  private

    def adverse_event_params
      params.required(:adverse_event).permit(:origination_date, :user_id, :complaint_id, :date_of_event,
                                             :age, :gender, :weight, :event_description,
                                             :customer_feeling, :attending_health_professional,
                                             :hospitalized, :hospital_location, :relevant_tests,
                                             :other_relevant_history, :frequency, :usage, :timing,
                                             :therapy_dates, :abated_after_use_stopped,
                                             :reappeared_after_reintroduced, :previous_usage_history,
                                             :customer_usage_reason, :other_therapies)
    end

end
