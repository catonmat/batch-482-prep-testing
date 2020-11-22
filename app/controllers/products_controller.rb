class ProductsController < ApplicationController
  # disable login for homepage
  skip_before_action :authenticate_user!, only: :index

  def index
    # load all the products from the database
    @products = Product.all
  end
end
