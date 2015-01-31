require 'rails_helper'

RSpec.describe "articles/new.html.erb", :type => :view do

  xit "enables us to post a new article" do
    assign(:article, Article.new)
    visit "/articles/new"
    fill_in "Title", with: "article title"
    fill_in "Url", with: "http://google.com"
    expect(lambda{ click_button "Post Article" }).to change{ Article.count }.by(1)
  end
  
end
