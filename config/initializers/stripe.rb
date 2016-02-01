if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_q38Er6AyAy8Kh2QiFsHXRESL',
    :secret_key => 'sk_test_KF9mspSBMMXS49PNMwbcZTCq'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

