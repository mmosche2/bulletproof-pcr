class WelcomeController < ApplicationController
  before_action :auth_user, except: [:index]

  def index
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
    @complaints = Complaint.all
    @returns = Return.all
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

    def auth_user
      redirect_to root_url if !user_signed_in?
    end

end
