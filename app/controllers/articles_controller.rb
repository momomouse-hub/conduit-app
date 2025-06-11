class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_article, only: [ :edit, :update, :show, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]
  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(5)
  end

  def edit
  end

  def update
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
    @article.user = current_user
    if @article.save
      redirect_to articles_path, notice: "Article was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: "Article was successfully deleted.", status: :see_other
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def authorize_user!
    unless current_user == @article.user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
