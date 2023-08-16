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
  end

  def create
    #Below line says that require the top level key of article and permit title and description from their to be
    # used to create this article object or article instance variable.
    @article = Article.new(params.require(:article).permit(:title, :description))
    #Below render method is used to print the result into the browser
    # render plain: @article.inspect
    @article.save

    #Below statement generates the url: http://localhost:3000/articles/29  where '29' is id of last article saved.
    redirect_to @article #Here @article contain the id of last saved article

  end

end