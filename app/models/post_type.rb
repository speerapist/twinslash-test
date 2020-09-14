class PostType < ApplicationRecord
	validates :name, uniqueness: true
	has_many :posts
end
