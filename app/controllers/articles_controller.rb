class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # byebug

  end

  def index
    #This article must be instance variable because we have to other parts of application also.
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    #Below line says that require the top level key of article and permit title and description from their to be
    # used to create this article object or article instance variable.
    @article = Article.new(article_params)
    #Below line is write in lecture 130 because we have to create authentication but here we hardcode the user_id
    # for every article.
    @article.user = User.first
    #Below render method is used to print the result into the browser
    # render plain: @article.inspect
    if @article.save
      # rails provides a flash helper to display the message
      # There are two different types of key used in flash 1. notice 2. alert
      # alert is generally used when something goes wrong.
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end
    #Below statement generates the url: http://localhost:3000/articles/29  where '29' is id of last article saved.
  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy

    @article.destroy
    # It generates the URL for the "index" action of the "articles" controller.
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end