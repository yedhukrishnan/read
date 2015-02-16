require 'rails_helper'

RSpec.describe "articles/new.html.erb", :type => :view do

  before(:example) do
    user = FactoryGirl.create(:user)
    visit "/users/sign_in"
    fill_in "Login", with: user.username
    fill_in "Password", with: user.password
    click_button "Log in"
  end  
  
  it "enables us to post a new article" do
    assign(:article, Article.new)
    category = Category.create({ name: "MyCategory" })
    visit "/articles/new"
    fill_in "Title", with: "article title"
    fill_in "Url", with: "http://google.com"
    select category.name, from: "Category"
    expect(lambda{ click_button "Post Article" }).to change{ Article.count }.by(1)
  end
  
end
