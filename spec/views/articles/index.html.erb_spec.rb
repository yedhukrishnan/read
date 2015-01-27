require 'rails_helper'

RSpec.describe "articles/index.html.erb", :type => :view do

  before(:example) do
    Article.create({ title: "Sample Article", url: "http://sample1.com" })
    Article.create({ title: "Lorem Ipsum", url: "https://sample2.com" })
    assign(:articles, Article.paginate({ page: 1, per_page: 15 }))
  end
  
  it "shows a list of articles" do
    render
    expect(rendered).to include("Sample Article")
    expect(rendered).to include("Lorem Ipsum")
  end
  
end