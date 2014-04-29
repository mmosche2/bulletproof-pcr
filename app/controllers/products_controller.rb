class ProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to account_path
    else
      render "new"
    end
  end

  # AJAX only - updates skus when product select is changed
  def get_skus
    product = Product.find_by_name(params[:product_name])
    sku = product.sku if product.present?
    respond_to do |format|
      format.js { render json: sku }
    end
  end

  private

    def product_params
      params.required(:product).permit(:sku, :name)
    end

end
