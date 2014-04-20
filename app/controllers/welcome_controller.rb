class WelcomeController < ApplicationController
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

end
