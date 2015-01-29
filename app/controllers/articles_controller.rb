class ArticlesController < ApplicationController

  def index
    @articles = Article.paginate({ page: params[:page], per_page: 15 }).order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Yay!! We have added your post!"
      redirect_to articles_path
    end
    
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end

end
