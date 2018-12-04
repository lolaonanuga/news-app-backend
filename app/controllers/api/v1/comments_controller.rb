class Api::V1::CommentsController < ApplicationController

    before_action :find_story, only: [:show, :update]
  def index
    @comments = Comment.all
    render json: @comments
  end


  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
        render json: @comments
    else
        render json: {error: 'Unable to add comment.'}, status: 400
    end
  end

  def update
    @comment = Comment.update(comment_params)
    if @comment
        render json: @comments
    else
        render json: {error: 'Unable to like comment.'}, status: 400
    end

  end


  private

  def comment_params
    params.require(:comment).permit([:text, :story_id, :created_at, :likes])
  end

  def find_story
    @comment = Comment.find(params[:id])
  end

end
