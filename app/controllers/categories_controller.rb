class CategoriesController < ApplicationController
  def show
    @article = Article.find_by(category_id: params[:id])
    @articles = Article.where(category_id: params[:id]).order('created_at DESC')
  end
end
