class TalksController < ApplicationController
  def index
    @talks = Talk.order("created_at DESC")
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to talks_path
    else
      render :new
    end
  end

  def show
    @talk = Talk.find(params[:id])
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
