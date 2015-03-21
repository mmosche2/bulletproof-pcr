class ComplaintsController < ApplicationController
  before_action :authenticate_user!

  def new
    @complaint = Complaint.new
    @complaint.build_customer
    @complaint.faulty_products.build
    3.times {|i| @complaint.complaint_images.build }
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
    3.times {|i| @complaint.complaint_images.build }
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

  def remove_image
    @complaint = Complaint.find(params[:complaint_id])
    @complaint_image = @complaint.complaint_images.find(params[:complaint_image_id])
    @complaint_image.image.destroy
    @complaint_image.destroy
    redirect_to edit_complaint_path(@complaint)
  end


  private

    def complaint_params
      params.require(:complaint).permit(:received_date, :user_id, :pc_number, :customer_id, :status, :order_number, :is_returned, :is_refunded, :refund_amount, :return_quantity, :tracking_link, :immediate_response, :adverse_reaction, :summary, :correspondence_history, customer_attributes: [:id, :name, :email, :phone, :address, :city, :state, :zip], faulty_products_attributes: [:id, :product_id, :quantity_reported, :size_count, :lot, :expiration, :_destroy], complaint_images_attributes: [:id, :image])
    end

end
