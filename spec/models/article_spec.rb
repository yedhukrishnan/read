require 'rails_helper'

RSpec.describe Article, :type => :model do

  subject { Article.new }

  it { is_expected.to belong_to :category }
  it { is_expected.to belong_to :user }
  
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :url }
  it { is_expected.to respond_to :votes }

  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should validate_presence_of :category_id }

  it "validates the url" do
    category = Category.create({ name: "some_category" })
    article = Article.new({ title: "some good article", category: category })
    article.url = "invalid-url"
    expect(article).not_to be_valid
    article.url = "https://google.com"
    expect(article).to be_valid
  end

end
