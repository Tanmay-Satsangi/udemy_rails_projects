class ArticlesController < ApplicationController

  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    #This article must be instance variable because we have to other parts of application also.
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #Below line says that require the top level key of article and permit title and description from their to be
    # used to create this article object or article instance variable.
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # It generates the URL for the "index" action of the "articles" controller.
    redirect_to articles_path
  end
end