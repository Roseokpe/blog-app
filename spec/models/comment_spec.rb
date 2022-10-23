require 'rails_helper'
require 'ffi'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'John', photo: 'https://www.google.com/url', bio: 'I am a software developer',
                     posts_counter: 3)
  post = Post.create(title: 'Hello', text: 'Hello world', author_id: user.id, likes_counter: 6, comments_counter: 3)

  comment = Comment.create(text: 'Hello world', post_id: post.id)

  context 'Update comments counter' do
    comment.update_comments_counter

    it 'should increment comments counter' do
      expect(post.comments_counter).to eq(3)
    end
  end
end