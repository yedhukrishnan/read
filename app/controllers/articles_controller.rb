class ArticlesController < ApplicationController

  before_filter :authenticate_user!, only: [:new]
  
  def index
    @articles = Article.paginate({ page: params[:page], per_page: 15 }).order('created_at DESC')
  end

  def new
    @article = Article.new
    @categories = Category.all.order(:name)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = I18n.t("article.create_success_message")
      redirect_to articles_path
    else
      flash[:error] = I18n.t("article.create_failure_message")
      redirect_to new_article_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :category_id)
  end

end
