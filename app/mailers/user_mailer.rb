class UserMailer < ApplicationMailer

  def contact_form(email, name, message)
    @message = message
    mail(
      from: email,
      to: "evasmail@gmail.com",
      subject: "A new contact form message from #{name}")
  end

  def welcome(user)
  	@user = user
  	mail(
  		to: user.email,
  		subject: "Thanks for registering, #{user.first_name}!")
  end

  def order_confirmation(user, stripe_email, cart)
    @cart = cart
    @user = user
    mail(
      to: stripe_email, 
      subject: "Your order at berlincoffee has been received, #{user.first_name}!")
  end

end
