# require 'rails_helper'

# RSpec.describe PostsController, type: :request do
#   describe 'GET /posts index' do
#     let(:user) { User.create(name: 'Ahmad', photo: 'https://unsplash.com/photos/m6dJm3XeZoU', bio: 'Ahmad Bio') }
#     let(:post) { Post.create(title: 'title', text: 'text', author_id: user.id) }

#     it 'returns a successful response' do
#       get '/posts'
#       expect(response).to be_successful
#     end
#     it 'renders correct template' do
#       get user_posts_path(user)
#       expect(response).to render_template(:index)
#     end
#     it 'renders correct template' do
#       get user_posts_path(user)
#       expect(response.body).to include('Posts')
#     end
#   end

#   describe 'GET /posts show' do
#     let(:user) { User.create(name: 'Ahmad', photo: 'https://unsplash.com/photos/m6dJm3XeZoU', bio: 'Ahmad Bio') }
#     let(:post) { Post.create(title: 'title', text: 'text', author_id: user.id) }

#     it 'returns a successful response' do
#       get '/users/:user_id/posts'
#       expect(response).to be_successful
#     end
#     it 'renders correct template' do
#       get user_posts_path(user, post)
#       expect(response).to render_template(:index)
#     end
#     it 'renders correct template' do
#       get user_posts_path(user, post)
#       expect(response.body).to include('Post')
#     end
#   end
# end
