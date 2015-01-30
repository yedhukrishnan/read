require 'rails_helper'

RSpec.describe Article, :type => :model do

  subject { Article.new }

  it { is_expected.to belong_to :category }
  
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :url }
  it { is_expected.to respond_to :votes }

  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should validate_presence_of :category_id }

end
