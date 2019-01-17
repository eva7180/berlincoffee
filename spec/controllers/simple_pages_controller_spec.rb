require 'rails_helper'

RSpec.describe SimplePagesController, type: :controller do
	context 'GET #index' do
		it "renders the index template" do
			get :index
			expect(response).to be_ok
			expect(response).to render_template('index')
		end
	end

	context 'GET #about' do
		it 'renders the about template' do
			get :about
			expect(response).to be_ok
			expect(response).to render_template('about')
		end
	end

	context 'GET #contact' do
		it 'renders the contact template' do
			get :contact
			expect(response).to be_ok
			expect(response).to render_template('contact')
		end
	end

	context 'POST #thank_you' do
		it 'renders the thank_you template' do
			post :thank_you, params: { name: "eihi", email: "oihih", message: "uhukjh"}
			expect(response).to be_ok
			expect(response).to render_template('thank_you')
		end
	end

end
