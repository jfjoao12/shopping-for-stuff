class CheckoutController < ApplicationController
  # POST, so product_id will be in the POST payload!
  def create
    # Here we are going to create a Stripe session then
    # redirect the user to the checkout page
    # Fetch the product in question!
    product = Product.find(params[:product_id])

    if product.nil?
      redirect_to root_path
      return
    end

    # Will be updated to redirect to Stripe!
    redirect_to root_path
  end

  def success
    # We go here if the payment succeeded!
  end

  def cancel
    # Something went wrong!
  end
end
