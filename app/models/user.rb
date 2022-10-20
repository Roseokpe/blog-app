class User < ApplicationRecord
    has_many :class_name: 'Comment', foreign_key: 'author_id'
    has_many :class_name: 'Post', foreign_key: 'author_id'
    has_many :class_name: 'Like', foreign_key: 'author_id'
end