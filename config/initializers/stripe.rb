if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_mBBUsq7sIYIN1N4gzoytep2H',
    secret_key: 'sk_test_58X1kq4EZTkRu0YMshAoKJaz'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]