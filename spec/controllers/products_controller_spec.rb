require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:test_product) { FactoryBot.create(:product) }
  let(:admin) { FactoryBot.create(:admin_user) }
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'renders the products/index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end

    it 'assigns @products' do
      get :index
      expect(assigns(:products)).to eq [test_product]
    end
  end

  describe 'GET #show' do
    it 'loads correct product' do
      get :show, params: { id: test_product.id }
      expect(assigns(:product)).to eq test_product
    end

    it 'renders the products/show template' do
      get :show, params: { id: test_product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    context 'when user is logged in and has an admin role' do
      before do
        sign_in admin
      end

      it 'renders the products/new template' do
        get :new
        expect(response).to be_ok
        expect(response).to render_template('new')
      end
    end

    context 'when user is logged in and does not have admin role' do
      before do
        sign_in user
      end
      
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'when user is logged in and has an admin role' do
      before do
        sign_in admin
      end

      it 'loads correct product' do
        get :edit, params: { id: test_product.id }
        expect(assigns(:product)).to eq test_product
      end
      
      it 'renders the products/edit template' do
        get :edit, params: { id: test_product.id }
        expect(response).to be_ok
        expect(response).to render_template('edit')
      end
    end

    context 'when user is logged in and does not have admin role' do
      before do
        sign_in user
      end
      
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST products#create' do
    context 'when user is logged in and has an admin role' do
      before do
        sign_in admin
      end

      context 'with valid attributes' do
        it 'should save the new product in the database' do
          expect {
            post :create, params: { product: { name:  "Any Name" } }
          }.to change(Product, :count).by(1)
        end

        it 'should redirect to the product#show page' do
          post :create, params: { product: { name:  "Any Name" } }
          expect(response).to redirect_to Product.last
        end
      end

      context 'with invalid attributes' do
        it 'should not save the new product in the database' do
          expect {
            post :create, params: { product: { description:  "Any text" } }
          }.to_not change(Product, :count)
        end

        it 'should render product#new template' do
          post :create, params: { product: { description:  "Any text" } }
          expect(response).to render_template('new')
        end
      end
    end

    context 'when user is logged in and does not have admin role' do
      before do
        sign_in user
      end
      
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'PATCH/PUT products#update' do
    context 'when user is logged in and has an admin role' do
      before do
        sign_in admin
      end

      context 'with valid attributes' do
        it 'loads correct product' do
          put :update, params: { id: test_product.id, product: { name: "Edited Name" } }
          expect(assigns(:product)).to eq Product.last
        end

        it "changes product's attributes" do
          put :update, params: { id: test_product.id, product: { name: "Edited Name", description: "Edited", variety: "Edited" } }
          test_product.reload
          expect(test_product.description).to eq("Edited")
          expect(test_product.variety).to eq("Edited")
        end

        it 'redirects to products index page' do
          put :update, params: { id: test_product.id, product: { name: "Edited Name" } }
          expect(response).to redirect_to products_path
        end
      end

      context 'with invalid attributes' do
        it 'loads correct product' do
          put :update, params: { id: test_product.id, product: { name: nil } }
          expect(assigns(:product)).to eq Product.last
        end

        it "does not change product's attributes" do
          put :update, params: { id: test_product.id, product: { name: nil, description: "Edited", variety: "Edited" } }
          test_product.reload
          expect(test_product.description).to_not eq("Edited")
          expect(test_product.variety).to_not eq("Edited")
        end

        it 're-renders the products edit template' do
          put :update, params: { id: test_product.id, product: { name: nil } }
          expect(response).to render_template('edit')
        end
      end
    end

    context 'when user is logged in and does not have admin role' do
      before do
        sign_in user
      end
      
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE products#destroy' do
    context 'when user is logged in and has an admin role' do
      before do
        sign_in admin
      end

      it 'loads correct product' do
        delete :destroy, params: { id: test_product.id }
        expect(assigns(:product)).to eq test_product
      end

      it 'deletes product from database' do
        expect {
          delete :destroy, params: { id: test_product.id }
          }.to change(Product, :count).by(-1)
      end

      it 'redirects to products index page' do
        delete :destroy, params: { id: test_product.id }
        expect(response).to redirect_to products_path
      end
    end

    context 'when user is logged in and does not have admin role' do
      before do
        sign_in user
      end
      
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

end