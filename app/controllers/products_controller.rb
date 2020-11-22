class ProductsController < ApplicationController
  # disable login for homepage
  skip_before_action :authenticate_user!, only: :index

  def index
    # load all the products from the database
    @products = Product.all
  end

  def new
    # load an empty variable for the simple form
    @product = Product.new
  end

  def create
    # take form input and load into new product
    @product = Product.new(product_params)
    if @product.save
      # if the product saves, redirect to home page
      redirect_to root_path
    else
      # else render and error
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :tagline)
  end
end
