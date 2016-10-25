class SaleController < ApplicationController

	respond_to :html, :js



	def listallsales

		@orderstransaction = CustomerTransaction.all.order("created_at DESC")

	end

	def listprocessingsales

		@orders = Order.where(order_status_id: 2).order("created_at DESC")
		@orderstransaction = []
		@orders.each do |t|
			@orderstransaction << CustomerTransaction.find_by(order_id: t.id)
		end

	end

	def listcompletedsales

		@orders = Order.where(order_status_id: 1).order("created_at DESC")
		@orderstransaction = []
		@orders.each do |t|
			@orderstransaction << CustomerTransaction.find_by(order_id: t.id)
		end

	end

	def listcanceledsales

		@orders = Order.where(order_status_id: 3).order("created_at DESC")
		@orderstransaction = []
		@orders.each do |t|
			@orderstransaction << CustomerTransaction.find_by(order_id: t.id)
		end

	end

	def listsales
		@orders = Order.where(order_status_id: 4).order("created_at DESC")
    @orderstransaction = []
    @orders.each do |t|
      @orderstransaction << CustomerTransaction.find_by(order_id: t.id)
    end
	end

	def details
		details = params[:id]
		@detailorder = Order.find( details )
		@deliverycustomer = Customer.find( @detailorder.customer_id )
		@deliveryaddress = Address.find( @detailorder.address_id )

		@transaction = CustomerTransaction.where("order_id = ?", @detailorder.id ).first
		puts @transaction.inspect
		@billingcustomer = Customer.find( @transaction.customer_id )
		puts "pailas"
		@billingaddress = Address.find( @transaction.address_id )


		@productsorder = OrderProduct.where("order_id = ?", @detailorder.id )

	end

	def changecompleted
		id = params["id"]
		order = Order.find( id )
		order.order_status_id = 1
		order.save

		redirect_to listcompletedsales_sale_index_path
	end

	def changeprocessing
		id = params["id"]
		order = Order.find( id )
		order.order_status_id = 2
		order.save

		redirect_to listprocessingsales_sale_index_path
	end

	def changecanceled
		id = params["id"]
		order = Order.find( id )
		order.order_status_id = 3
		order.save

		redirect_to listcanceledsales_sale_index_path
	end



end
