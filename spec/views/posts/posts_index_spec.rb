require 'rails helper'

RSpec.describe 'post index', type: :system do
  describe 'index page' do
    before :all do
      @user = User.create(name: 'Winna', photo: 'https://i.imgur.com/1J8mYQJ.jpg',
                            bio: 'I am a software developer', posts_counter: 0)
      @post = Post.create(author: second_user, title: 'Welcome', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    end
    after(:all) do
      @post.destroy
    end

    it 'I can see the user/s profile picture' do
      visit user_posts_path(@user)
      expect(page).to have_css('img[src*="https://i.imgur.com/1J8mYQJ.jpg"]')
    end

    it 'I can see the users username' do
      visit user_posts_path(@user)
      expect(page).to have_content('Winna')
    end
  end
end