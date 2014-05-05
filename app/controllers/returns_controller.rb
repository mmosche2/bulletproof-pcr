class ReturnsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_or_new_return

  def new
    @return.build_customer if @return.customer.nil?
    @return.faulty_products.build if @return.faulty_products.empty?
  end

  def create
    @return.attributes = return_params
    if @return.save
      redirect_to edit_return_path(@return)
    else
      render "new"
    end
  end

  def update
    if @return.update(return_params)
      redirect_to edit_return_path(@return)
    else
      render 'edit'
    end
  end

  def edit
    @return.build_customer if @return.customer.nil?
    @return.faulty_products.build if @return.faulty_products.empty?
  end

  def show
  end

  def destroy
  end

  def index
    @returns = Return.all
  end


  private

    def find_or_new_return
      complaint_id = params[:complaint_id] || (params[:return] && params[:return][:complaint_id])
      @complaint = complaint_id ? Complaint.find(complaint_id) : nil
      if params[:id]
        @return = Return.find(params[:id])
      elsif @complaint
        @return = @complaint.return || @complaint.build_return(customer: @complaint.customer, user_id: @complaint.user_id)
        @return.faulty_products = @complaint.faulty_products
      else
        @return = Return.new
      end
    end

    def return_params
      params.require(:return).permit(:originating_date, :user_id, :customer_id, :complaint_id,
                      customer_attributes: [:id, :name, :email, :phone, :address, :city, :state, :zip],
                      faulty_products_attributes: [:id, :product_id, :quantity, :size_count, :lot, :expiration,
                                            :returned, :reason_for_return, :credit_amount_in_pennies,
                                            :credit_issued_date, :return_auth_num, :condition, :quarantined,
                                            :quarantined_area_by, :quarantined_area_date, :quarantined_sticker_by,
                                            :quarantined_sticker_date, :_destroy])
    end

end
