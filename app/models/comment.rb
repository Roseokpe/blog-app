class Comment < ApplicationRecord
  # belongs_to :class_name: 'User', foreign_key: 'author_id'
  # belongs_to :class_name: 'Post', foreign_key: 'post_id'
  # has_many :post_comment, through: :post, source: :author
  # has_many :user_comment, through: :user, source: :author
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
