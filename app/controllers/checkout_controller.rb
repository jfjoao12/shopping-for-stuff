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

    session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      mode: "payment",
      line_items: [
        price_data: {
          currency: "cad",
          product_data: {
            name: product.name,
            description: product.description,
          },
          unit_amount: product.price_cents
        },
        quantity: 1
      ]
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    # We go here if the payment succeeded!
  end

  def cancel
    # Something went wrong!
  end
end
