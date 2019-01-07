class UserMailer < ApplicationMailer

	def contact_form(email, name, message)
		@message = message
		mail(
			from: email,
			to: "evasmail@gmail.com",
			subject: "A new contact form message from #{name}")
	end
end
