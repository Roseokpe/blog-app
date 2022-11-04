require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
    before(:all) do
        @user = User.create(name: 'Beauty', photo: 'https://i.postimg.cc/nzyRgY75/Beauty.jpg', bio: 'Write from Ghana. posts_counter: 0')
        @post = Post.create(title: 'Hello', text: 'Hello, world!', author_id: @user.id)
    end

    it 'it shows post index page' do
        get '/users/#{@user.id}/posts'
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
        expect(response.body).to include('this is the first post')
    end

    it 'it shows post show page' do
        post =  Post.create(author: second_user, title: 'Welcome', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
        get "/users/#{second_user.id}/posts/#{post.id}"
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:show)
        expect(response.body).to include('one post')
    end
end