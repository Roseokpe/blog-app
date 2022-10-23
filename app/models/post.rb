class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: {only_integer: true, greater_than_or_equal_to: 0  }

  def return_recent_comments
    comment.order(created_at: :desc).limit(5)
  end

  

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
