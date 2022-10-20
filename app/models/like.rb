class Like < ApplicationRecord
    belongs_to :class_name: 'User', foreign_key: 'author_id'
    belongs_to :class_name: 'Post', foreign_key: 'post_id'
    has_many :post_like, through: :post, source: :author
    has_many :user_like, through: :user, source: :author
end