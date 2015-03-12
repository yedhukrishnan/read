class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :url,   presence: true, url: true
  validates :category_id, presence: true
	validates :user_id, presence: true

  belongs_to :category
  belongs_to :user

	has_many :upvotes
	has_many :upvoted_users, through: :upvotes, source: :user
end
