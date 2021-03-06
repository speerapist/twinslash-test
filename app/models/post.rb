class Post < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_content, against: %i[title content],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :user, optional: true
  belongs_to :post_type, optional: true
  has_many_attached :images

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, :user_id, presence: true

  enum status: %i[draft new_post rejected approved published archived]

  scope :new_posts, -> { where(status: 'new_post') }
end
