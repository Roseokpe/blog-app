require 'rails_helper'
require 'ffi'

RSpec.describe Like, type: :model do
  user = User.create(name: 'John', photo: 'https://www.google.com/url', bio: 'I am a software developer',
                     posts_counter: 3)
  post = Post.create(title: 'Hello', text: 'Hello world', author_id: user.id, likes_counter: 6, comments_counter: 3)

  like = Like.create(author_id: user.id, post_id: post.id)

  context 'Update likes counter' do
    like.update_likes_counter

    it 'should increment likes counter' do
      expect(post.likes_counter).to eq(6)
    end
  end
end