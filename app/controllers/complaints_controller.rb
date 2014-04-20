class ComplaintsController < ApplicationController
  before_action :authenticate_user!

  def new
    @complaint = Complaint.new
    @complaint.build_customer
    @complaint.faulty_products.build
  end

  def create
    @complaint = Complaint.new(complaint_params)
    if @complaint.save
      redirect_to complaints_path
    else
      render "new"
    end
  end

  def update
    @complaint = Complaint.find(params[:id])

    if @complaint.update(complaint_params)
      redirect_to edit_complaint_path(@complaint)
    else
      render 'edit'
    end
  end

  def edit
    @complaint = Complaint.find(params[:id])
  end

  def destroy
  end

  def index
    @complaints = Complaint.all
  end


  private

    def complaint_params
      params.required(:complaint).permit(:received_date, :user_id, :customer_id, :order_number, :immediate_response, :adverse_reaction, :summary, :correspondence_history, customer_attributes: [:id, :name, :email, :phone, :address, :city, :state, :zip], faulty_products_attributes: [:id, :product_id, :quantity, :size_count, :lot, :expiration, :_destroy])
    end

end
