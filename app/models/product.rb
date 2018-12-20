class Product < ApplicationRecord

# helper method to display prices with 2 decimals
	def display_price
		'%.2f' % self.price
	end

end
