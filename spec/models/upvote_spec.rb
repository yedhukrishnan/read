require 'rails_helper'

RSpec.describe Upvote, :type => :model do

  subject{ Upvote.new }
  
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :article_id }
  
end
