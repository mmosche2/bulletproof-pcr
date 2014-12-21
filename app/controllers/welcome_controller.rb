class WelcomeController < ApplicationController
  before_action :auth_user, except: [:index]
  helper_method :complaint_sort_column, :complaint_sort_direction, :return_sort_column, :return_sort_direction

  def index
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
    @complaints = Complaint.search(params[:search]).order(complaint_sort_column + ' ' + complaint_sort_direction).paginate(:per_page => 10, :page => params[:complaint_page])
    @returns = Return.search(params[:search]).order(return_sort_column + ' ' + return_sort_direction).paginate(:per_page => 10, :page => params[:return_page])
  end

  def account
    @agents = User.all
    @product = Product.new
    @products = Product.all
  end

  def update_notify_for_AER_for_agent
    user = User.find(params[:user_id])
    if user.notify_for_aer?
      user.notify_for_aer = false
    else
      user.notify_for_aer = true
    end
    user.save
    respond_to do |format|
      format.js { render json: {notify_bool: user.notify_for_aer} }
    end
  end

  private

  def complaint_sort_column
    Complaint.column_names.include?(params[:complaint_sort]) ? params[:complaint_sort] : "pc_number"
  end

  def complaint_sort_direction
    %w[asc desc].include?(params[:complaint_direction]) ? params[:complaint_direction] : "desc"
  end

  def return_sort_column
    Return.column_names.include?(params[:return_sort]) ? params[:return_sort] : "ra_number"
  end

  def return_sort_direction
    %w[asc desc].include?(params[:return_direction]) ? params[:return_direction] : "desc"
  end

  def auth_user
    redirect_to root_url if !user_signed_in?
  end

end
