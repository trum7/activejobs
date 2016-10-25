class ReviewController < ApplicationController

  def create
    @comment = params[:comment]
    @email = params[:email]
    @name = params[:name]
    @rate = params[:star2]
    @pro = params[:product]

    a = Review.new
    a.comment = @comment
    a.email = @email
    a.name = @name
    a.rating = @rate.to_i
    a.product_id = @pro

    a.save!

    redirect_to "/product/" + @pro +"/show"

  end

  def list

    @comme = Review.all

  end

  def latest

    @latest = Review.where("created_at > ?", 1.day.ago)

  end

  def see
    id = params["id"]
    @commen = Review.find( id )
  end

  def delete
    id = params["id"]
    c = Review.find( id )
    c.delete
    redirect_to list_review_index_path
  end


end
