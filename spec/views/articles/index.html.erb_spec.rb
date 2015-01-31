require 'rails_helper'

RSpec.describe "articles/index.html.erb", :type => :view do

  before(:example) do
    category = Category.create({ name: "dummy" })
    Article.create({ title: "Sample Article", url: "http://sample1.com", category_id: category.id })
    Article.create({ title: "Lorem Ipsum", url: "https://sample2.com", category_id: category.id })
    assign(:articles, Article.paginate({ page: 1, per_page: 15 }))
  end
  
  it "shows a list of articles" do
    render
    expect(rendered).to include("Sample Article")
    expect(rendered).to include("Lorem Ipsum")
    expect(rendered).to include("dummy")
  end
  
end
