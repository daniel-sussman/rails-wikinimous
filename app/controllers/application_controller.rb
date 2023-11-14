class ApplicationController < ActionController::Base
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.save
    redirect_to articles_path(article)
  end

  def show

  end

  def edit

  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.delete
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
