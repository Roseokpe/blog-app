class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy, foreign_key: 'post_id'
  has_many :likes, dependent: :destroy, foreign_key: 'post_id'

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  # validates :comments_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
