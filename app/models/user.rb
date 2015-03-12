class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
  attr_accessor :login
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :articles
	has_many :upvotes
	has_many :upvoted_articles, through: :upvotes, source: :article

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end  
end
