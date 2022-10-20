class Post < ApplicationRecord
    belongs_to :class_name: 'User', foreign_key: 'author_id'
    has_many :class_name: 'Comment', foreign_key: 'post_id'
end