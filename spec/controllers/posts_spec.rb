require 'rails_helper'

RSpec.describe PostsController, type: :request do
    describe 'GET index' do
        it 'check if response status was correct' do
            get user_posts_path(1)
            expect(response).to be_successful
        end

        it 'If a correct template was rendered' do
            get user_posts_path(1)
            expect(response).to render_template(:index)
        end

        it 'If the response body includes correct placeholder text.' do
            get user_posts_path(1)
            expect(response.body).to include('posts display')
        end

    end

    describe 'GET show' do
        it 'check if response status was correct' do
            get user_post_path(1, 1)
            expect(response).to be_successful
        end

        it 'If a correct template was rendered' do
            get user_post_path(1, 1)
            expect(response).to render_template(:show)
        end

        it 'If the response body includes correct placeholder text.' do
            get user_post_path(1, 1)
            expect(response.body).to include('more details on post')
        end
    end
end