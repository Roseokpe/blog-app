require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  it 'it shows user index page' do
    get '/users'
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
    expect(response.body).to include('All users')
  end
    
  it "show each user page" do
    user = User.create(name: 'Beauty', photo: 'https://i.postimg.cc/nzyRgY75/Beauty.jpg', bio: 'Write from Ghana. posts_counter: 0')
    get "/users/#{user.id}"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
    expect(response.body).to include('Beauty') 
  end
  
end
