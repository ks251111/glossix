class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, article_id: params[:article_id])
    redirect_to article_path(@like.article)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, article_id: params[:article_id]).destroy
    redirect_to article_path(@like.article)
  end
end
