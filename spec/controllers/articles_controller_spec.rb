require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do
  include Devise::TestHelpers

  describe "GET index" do    
    it "renders the article list page" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "renders form for creating a new article" do
      sign_in user = FactoryGirl.create(:user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
