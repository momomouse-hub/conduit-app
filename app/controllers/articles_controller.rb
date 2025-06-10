class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]
  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "Article was successfully created."
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path, notice: "Article was successfully deleted.", status: :see_other
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, :tag_list)
  end

  def authorize_user!
    unless current_user == @article.user
      redirect_to root_path, alert: "権限がありません"
    end
  end
end
