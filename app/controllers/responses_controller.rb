class ResponsesController < ApplicationController
  def create
    @response = Response.create(response_params)
    if @response.save
      redirect_to talk_path(@response.talk)
    else
      @talk = @comment.talk
      @responses = @talk.responses
      render "talks/show"
    end
  end

  private

  def response_params
    params.require(:response).permit(:text).merge(user_id: current_user.id, talk_id: params[:talk_id])
  end
end
