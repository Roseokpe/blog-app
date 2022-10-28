require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET index' do
    it 'check if response status was correct' do
      get user_path(1)
      expect(response).to be_successful
    end

    it 'If a correct template was rendered' do
      get user_posts_path(1)
      expect(response).to render_template(:index)
    end

    it "If the response body includes correct placeholder text, ' hellow world: '" do
      get users_path(1)
      expect(response.body).to include(' hellow world ')
    end
  end

  describe 'GET show' do
    it 'check if response status was correct' do
      get user_path(1, 1)
      expect(response).to be_successful
    end

    it 'If a correct template was rendered' do
      get user_path(1, 1)
      expect(response).to render_template(:show)
    end

    it 'If the response body includes correct placeholder text.' do
      get user_path(1, 1)
      expect(response.body).to include(' show each user ')
    end
  end
end
