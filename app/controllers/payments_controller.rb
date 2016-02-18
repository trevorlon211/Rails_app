class PaymentsController < ApplicationController

  def create 
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price).to_i,
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
        )
      if charge.paid
        Order.create(
          :product_brand => @product.brand,
          :product_id => @product.id,
          :user_id => current_user,
          :total => @product.price,
          )
        UserMailer.thank_you(@user).deliver_now
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately there was an error processing your payment: #{err[:message]}"
    end
  end
end
