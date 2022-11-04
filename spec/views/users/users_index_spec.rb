# require 'rails_helper'

# RSpec.describe 'Users index', type: :system do
#     describe 'index page' do
#         before(:all) do
#             @user = User.create(name: 'Beauty', photo: 'https://i.postimg.cc/nzyRgY75/Beauty.jpg', bio: 'Write from Ghana. posts_counter: 0')
#         end
#         after(:all) do
#             @user.destroy
#         end

#         it 'it shows user name' do
#             visit '/users'
#             expect(page).to have_content('Beauty')
#         end

#         it 'it shows user show page' do
#             visit '/users'
#             click_link('Beauty')
#             expect(page).to have_content('Beauty')
#         end
#     end
# end
require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'rose Emily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a Full-stack developer', posts_counter: 2)
    @user2 = User.create(name: 'Richard', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'I am a software developer', posts_counter: 1)
  end
  scenario 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'displays all users profile photo' do
    visit user_path(id: @user.id)
    visit user_path(id: @user2.id)
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  scenario 'displays number of posts' do
    visit '/'
    expect(page).to have_content(@user.posts_counter)
  end

  scenario 'renders the user show page' do
    visit '/'
    click_link(@user.user)
    expect(page).to have_content(@user.user)
  end
end