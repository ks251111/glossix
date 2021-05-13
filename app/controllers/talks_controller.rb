class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def update
    @talk.update(talk_params)
    if @talk.save
      redirect_to talk_path
    else
      render :edit
    end
  end

  def destroy
    @talk.destroy
    redirect_to talks_path
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_talk
    @talk = Talk.find(params[:id])
  end
end
