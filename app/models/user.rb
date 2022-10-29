class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :posts_counter, length: { in: 0..1000 }
  validates :name, presence: true, length: { in: 3..20 }
  def return_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
