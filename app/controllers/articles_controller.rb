class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    # to show the comments
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    # Flash notice to show creation of article
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    # Flash notice to show update of article
    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # Flash notice to show deletion of article
    flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to action: 'index'
  end
end
