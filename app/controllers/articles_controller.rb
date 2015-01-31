class ArticlesController < ApplicationController

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
      flash[:success] = "Yay!! We have added your post!"
      redirect_to articles_path
    else
      flash[:error] = "Seems like you missed out something!"
      redirect_to new_article_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :category_id)
  end

end
