class Api::V1::StoriesController < ApplicationController

    before_action :find_story, only: [:update]
  def index
    @stories = Story.all
    render json: @stories
  end

  def create
    @story.create(story_params)
  end

  def update
    @story.update(story_params)
    if @story.save
      render json: @story, status: :accepted
    else
      render json: { errors: @story.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def delete
    @story.destroy
    @stories = Story.all
    render json: @stories
  end

  private

  def story_params
    params.permit(:title, :url, :comments)
  end

  def find_story
    @story = Story.find(params[:id])
  end

end
