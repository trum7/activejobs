class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :require_admin

  def admin_index
    @orders = Order.where(order_status_id: 4).order("created_at DESC")
    @orderstransaction = []
    @orders.each do |t|
      @orderstransaction << CustomerTransaction.find_by(order_id: t.id)
    end
    @comment = Review.last(3)
  end

  def userlist
    @userslist = User.all
  end

  def beadmin
    a = User.find(params[:id])
    a.role = 53
    a.save
    redirect_to userlist_admin_index_path
  end

  def removeadmin
    a = User.find(params[:id])
    a.role = 7
    a.save
    redirect_to userlist_admin_index_path
  end

end
