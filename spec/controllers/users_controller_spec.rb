require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users index' do
    let(:user) { User.create(name: 'Ahmad', photo: 'https://unsplash.com/photos/m6dJm3XeZoU', bio: 'Ahmad Bio') }

    it 'returns a successful response' do
      get '/users'
      expect(response).to be_successful
    end
    it 'renders correct template' do
      get users_path(user)
      expect(response).to render_template(:index)
    end
    it 'renders correct template' do
      get users_path(user)
      expect(response.body).to include('Users')
    end
  end

  describe 'GET /users show' do
    let(:user) { User.create(name: 'Ahmad', photo: 'https://unsplash.com/photos/m6dJm3XeZoU', bio: 'Ahmad Bio') }

    it 'returns a successful response' do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end
    it 'renders correct template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end
    it 'renders correct template' do
      get user_path(user)
      expect(response.body).to include('User')
    end
  end
end
