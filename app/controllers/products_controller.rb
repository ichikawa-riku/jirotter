class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: params[:id])
  end

  def index
    @products = Product.all.includes(:reviews)
  end
end
