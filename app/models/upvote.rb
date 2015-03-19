class Upvote < ActiveRecord::Base
  validates :user_id, presence: true
  validates :article_id, presence: true
  belongs_to :user
  belongs_to :article
end
