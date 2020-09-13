class Post < ApplicationRecord
	belongs_to :user, optional: true
	validates :title, presence: true
	validates :content, presence: true

	enum status: %i[draft new_post rejected approved published archived]

end
