class ContactAttemptsController < ApplicationController
  before_action :authenticate_user!

  def create
    @contact_attempt = ContactAttempt.new(contact_attempt_params)
    if @contact_attempt.save
      redirect_to edit_complaint_path(@contact_attempt.adverse_event.complaint)
    else
      render "new"
    end
  end

  def update
    @contact_attempt = ContactAttempt.find(params[:id])

    if @contact_attempt.update(contact_attempt_params)
      redirect_to edit_complaint_path(@contact_attempt.adverse_event.complaint)
    else
      render 'edit'
    end
  end

  def edit
    @contact_attempt = ContactAttempt.find(params[:id])
  end

  def destroy
  end


  private

    def contact_attempt_params
      params.required(:contact_attempt).permit(:note, :adverse_event_id, :user_id)
    end

end
