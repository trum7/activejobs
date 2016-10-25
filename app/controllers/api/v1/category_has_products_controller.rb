class Api::V1::CategoryHasProductsController < ApplicationController
  respond_to :json
  def index
     @chp = CategoryHasProduct.all
     respond_with @chp
  end
  def show
    @API_Product = Product.find(params[:id])
    respond_with CategoryHasProduct.find_by( product_id: @API_Product.id.to_s  )
  end
end
