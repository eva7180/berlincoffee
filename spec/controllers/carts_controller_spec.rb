require 'rails_helper'

RSpec.describe CartsController, type: :controller do
	context 'GET #show' do
		it 'renders the show template ' do
			get :show
			expect(response).to be_ok
			expect(response).to render_template('show')
		end
	end

	context 'DELETE #destroy' do
	end


end
