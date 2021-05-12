class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, article_id: params[:id])
    redirect_to articles_path
  end
end
