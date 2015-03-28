require 'rails_helper'

describe AuthenticationController, :type => :controller do

  describe 'when email and password are valid' do
    it 'renders the products page' do
      user = User.create(email: 'user@test.com',
                         password: 'password')

      post :create, {email: user.email, password: user.password}
      # test that we end up redirected to the correct page
      # expect(current_url).to eq(users_path)
      expect(flash[:notice]).to eq('You have successfully signed in.')
    end
  end

  describe 'when email is invalid' do
    it 'renders the page with error' do
      user = User.create(email: 'user@test.com', password: 'password')

      post :create, {email: 'user1@test.com', password: user.password}
      expect(assigns[:sign_in_error]).to eq('Username / password combination is invalid')
      expect(response).to render_template(:new)
    end
  end

  describe 'when password is invalid' do
    it 'renders the page with error' do
      user = User.create(email: 'user@test.com',
                         password: 'password')

      post :create, {email: user.email, password: 'password1'}
      expect(assigns[:sign_in_error]).to eq('Username / password combination is invalid')
      expect(response).to render_template(:new)
    end
  end

  describe 'when email and password are invalid' do
    it 'renders the page with error' do
      user = User.create(email: 'user@test.com',
                         password: 'password')

      post :create, {email: 'user1@test.com', password: 'password1'}
      expect(assigns[:sign_in_error]).to eq('Username / password combination is invalid')
      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE#destroy' do
    it 'redirects with a notice' do
      delete :destroy

      expect(flash[:notice]).to eq('You have successfully signed out.')
      expect(response).to redirect_to '/products'
    end
  end
end
