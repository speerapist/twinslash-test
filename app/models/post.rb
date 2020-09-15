class Post < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :post_type, optional: true
	has_many_attached :images
	
	validates :title, presence: true
	validates :content, presence: true

	enum status: %i[draft new_post rejected approved published archived]

	scope :new_posts, -> { where(status: 'new_post') }

end
