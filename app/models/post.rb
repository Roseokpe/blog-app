class Post < ApplicationRecord
  # belongs_to :class_name: 'User', foreign_key: 'author_id'
  # has_many :class_name: 'Comment', foreign_key: 'post_id'

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  def return_recent_comments
    comment.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
