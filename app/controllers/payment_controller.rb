class PaymentController < ApplicationController
  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

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
      if result.success?

        @transaction = Braintree::Transaction.find(result.transaction.id)


        ord = Order.new
        ord.customer_id = session[:billingCustomer]
        ord.order_status_id = 4
        ord.address_id = session[:address]
        ord.save
        ord = Order.order("created_at").last

        cus = CustomerTransaction.new
        cus.braintreeid = @transaction.id
        cus.braintreetype = @transaction.type
        cus.amount = @transaction.amount
        cus.braintreestatus = @transaction.status
        cus.customer_id = session[:billingCustomer]
        cus.order_id = ord.id
        cus.address_id = session[:billingaddress]

        cus.save

        session[:cart].each do |t|
          puts "aca"
          puts t[0]
          w = t[0]
          b = Product.find(w)
          a = OrderProduct.new
          a.name = b.name
          a.quantity = session[:cart][w].to_i
          a.price = b.price
          a.length = b.length
          a.width = b.width
          a.height = b.height
          a.weight = b.weight
          a.description = b.description
          a.discount = b.discount
          a.order_id = ord.id

          if a.save
            b.quantity -= a.quantity
            if b.quantity == 0
              b.status = "0"
            end   
            b.save
          end

        end
        session[:cart] = {}
      end

      redirect_to payment_path(result.transaction.id)

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
