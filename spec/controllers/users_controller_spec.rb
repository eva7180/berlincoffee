require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:user) {User.create!(email: "email@email.com", password: "jiohreroi")}
	let(:user2) {User.create!(email: "user2@email.com", password: "uuiuhsfwt")}

	describe "GET #show" do
		context "when a user is logged in" do
			before do
				sign_in user
			end

			it "loads correct user details" do
				get :show, params: { id: user.id }
				expect(response).to be_ok
				expect(assigns(:user)).to eq user
			end

			it "redirects to root when accessing other users show page" do
				get :show, params: { id: user2.id }
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)	
			end

		end

		context "when a user is not logged in" do
			it "redirects to login" do
				get :show, params: { id: user.id }
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end
