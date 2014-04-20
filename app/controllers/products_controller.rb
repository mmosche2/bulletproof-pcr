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

  private

    def product_params
      params.required(:product).permit(:sku, :name)
    end

end
