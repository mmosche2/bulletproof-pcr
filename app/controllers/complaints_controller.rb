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
      redirect_to edit_complaint_path(@complaint)
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
    @complaint.build_customer if @complaint.customer.nil?
    @complaint.faulty_products.build if @complaint.faulty_products.empty?
  end

  def show
    @complaint = Complaint.find(params[:id])
  end

  def destroy
  end

  def index
    @complaints = Complaint.all
  end

  def print
    @complaint = Complaint.find(params[:complaint_id])
    @customer = @complaint.customer
    @faulty_products = @complaint.faulty_products
    @adverse_event = @complaint.adverse_event
    @contact_attempts = @adverse_event.contact_attempts if @adverse_event
    respond_to do |format|
      format.pdf do
        render :pdf => 'print'
      end
    end
  end


  private

    def complaint_params
      params.require(:complaint).permit(:received_date, :user_id, :pc_number, :customer_id, :status, :order_number, :is_returned, :is_refunded, :refund_amount, :return_quantity, :immediate_response, :adverse_reaction, :summary, :correspondence_history, customer_attributes: [:id, :name, :email, :phone, :address, :city, :state, :zip], faulty_products_attributes: [:id, :product_id, :quantity_reported, :size_count, :lot, :expiration, :_destroy])
    end

end
