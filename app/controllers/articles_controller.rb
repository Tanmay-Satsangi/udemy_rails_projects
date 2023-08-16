class ArticlesController < ApplicationController

  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    #This article must be instance variable because we have to use in views
    @articles = Article.all
  end

  def new
  end

  def create
    render plain: params[:article]
  end

end