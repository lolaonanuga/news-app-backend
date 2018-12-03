class Api::V1::CommentsController < ApplicationController

    before_action :find_story, only: [:update]
  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment.create(comment_params)
  end


  def delete
    @comment.destroy
    @comments = Comment.all
    render json: @comments
  end

  private

  def comment_params
    params.permit(:audio_clip, :story_id)
  end

  def find_story
    @comment = Comment.find(params[:id])
  end

end
