class WelcomeController < ApplicationController
  before_action :auth_user, except: [:index]

  def index
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
    @complaints = Complaint.all
  end

  def account
    @agents = User.all
    @product = Product.new
    @products = Product.all
  end

  private

    def auth_user
      redirect_to root_url if !user_signed_in?
    end

end
