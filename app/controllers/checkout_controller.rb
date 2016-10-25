class CheckoutController < ApplicationController

  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  respond_to :html, :js

  def index

    current_cart
    @productcart = []
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    # respond_to do |format|
    #   format.html
    # end

  end

  def cart

    current_cart
    @productcart = []
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end

    respond_to do |format|
      format.html
    end

  end
  def first
    @country = Country.all
    puts @country.first
    @addr2 = []
    if current_user != nil
      customers = Customer.where(:user_id => current_user.id)
      if customers != nil
        customers.each do |x|
          @addr2 << Address.find_by(customer_id: x.id )
        end
      end
    end

    respond_to do |format|
      format.js
    end

  end

  def first_data
    customer = Customer.new
    customer.firstname = params["firstname"]
    customer.lastname = params["lastname"]
    customer.email = params["email"]
    customer.telephone = params["phone"]
    customer.status = 1

    if current_user != nil
      customer.user_id = current_user.id
    end

    customer.save
    customer = Customer.order("created_at").last
    address = Address.new
    address.address = params["street"]
    address.city = params["city"]
    address.state = params["state"]
    address.zip = params["zip"]
    address.customer = customer
    address.country_id = Country.find_by(name: params["country"]).id

    address.save!
    address = Address.order("created_at").last
    session[:address] = address.id


    #session[:address] = customer

    respond_to do |format|
      format.js
    end

    redirect_to billing_checkout_index_path

  end

  def yesdeliveryaddress
    valor = params["address2"]
    @country = Country.all
    @addr = []
    if current_user != nil
      customers = Customer.where(:user_id => current_user.id)
      if customers != nil
        customers.each do |x|
          @addr << Address.find_by(customer_id: x.id )
        end
      end
    else
      @addr = [Address.find(session[:address])]
      puts @addr
    end
    session[:address] = valor
    puts session[:address]
  end

  def yesbillingaddress
    session[:billingaddress] = params["address"]
    session[:billingCustomer] = Address.find(params["address"]).customer_id
    redirect_to second_checkout_index_path
  end

  def billing
    @country = Country.all
    @addr = []
    if current_user != nil
      customers = Customer.where(:user_id => current_user.id)
      if customers != nil
        customers.each do |x|
          @addr << Address.find_by(customer_id: x.id )
        end
      end
    else
      @addr = [Address.find(session[:address])]
      puts @addr
    end

  end

  def billingComplete


    customer = Customer.new
    customer.firstname = params["firstname"]
    customer.lastname = params["lastname"]
    customer.email = params["email"]
    customer.telephone = params["phone"]
    customer.status = 1

    if current_user != nil
      customer.user_id = current_user.id
    end

    customer.save
    customer = Customer.order("created_at").last
    address = Address.new
    address.address = params["street"]
    address.city = params["city"]
    address.state = params["state"]
    address.zip = params["zip"]
    address.customer = customer
    address.country_id = Country.find_by(name: params["country"]).id

    address.save!
    address = Address.order("created_at").last

    session[:billingCustomer] = customer.id
    session[:billingaddress] = address.id
    redirect_to second_checkout_index_path
  end

  def second
    puts session[:address]
    puts session[:billingaddress]
    puts session[:billingCustomer]


    @valor = session[:sum]
    @client_token = Braintree::ClientToken.generate
    render layout: "transaction"

  end

  def deletecart
    id = params[:id]
    current_cart
    @productcart = []
    session[:cart].delete( id )
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    @productcart.each do |q|
      print q.name
    end
    respond_to do |format|
        format.js
    end
  end

  helper_method :total
  def total()
    @sum = 0.0
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    @productcart.each do |p|
      if p.discount != 0.0
        @sum+=(p.price.to_d - p.discount.to_d)* p.quantity.to_d
      else
        @sum+= (p.price.to_d)*p.quantity.to_d
      end
    end
    return @sum/2
  end



  def new
    @client_token = Braintree::ClientToken.generate
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success? || result.transaction
      redirect_to checkout_path(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
  end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your transaction has been successfully processed."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}."
      }
    end
  end

end
