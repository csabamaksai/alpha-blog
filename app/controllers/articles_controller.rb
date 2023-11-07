class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show; end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new # Create a new instance of Article at the first page load so be able to use
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    set_article
    @article.destroy
    flash[:notice] = "Article was deleted successfully."
    redirect_to articles_path
  end

  private # This is a private method that can only be called from within this class
    def set_article
      @article = Article.find(params[:id])
    end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end

# Path: app/controllers/articles_controller.rb
