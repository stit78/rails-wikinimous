class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :update, :destroy, :edit]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    @article.save

    redirect_to articles_path
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(params_article)

    redirect_to article_path(@article)
  end

  private

  def set_articles
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :content)
  end
end
