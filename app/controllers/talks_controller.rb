class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
