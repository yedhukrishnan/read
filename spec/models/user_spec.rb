require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { User.new }

	it { is_expected.to have_many :upvotes }
	it { is_expected.to have_many :upvoted_articles }

  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

end
