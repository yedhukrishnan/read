class ArticlesController < ApplicationController

  def index
    @articles = Article.paginate({ page: params[:page], per_page: 15 })
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end

end