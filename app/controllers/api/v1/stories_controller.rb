class Api::V1::StoriesController < ApplicationController

    before_action :find_story, only: [:update]

  def index
    # @current_stories = Story.where(active: true)
    # @archived_stories = Story.where(active: false)
    @stories = Story.all
    render json: @stories
  end

  def create
    @story = Story.new(story_params)
    if @story.save
        render json: @stories
    else
        render json: {error: 'Unable to add story.'}, status: 400
    end
  end
 
  def update
    @story.update(story_params)
    if @story.save
      render json: @story, status: :accepted
    else
      render json: { errors: @story.errors.full_messages }, status: :unprocessible_entity
    end
  end


#   def delete
#     @story.destroy
#     @stories = Story.all
#     render json: @stories
#   end

  private

  def story_params
    params.require(:story).permit([:title, :url, :comments, :id, :description, :image_url, :publishedAt, :active, :sentiment])
  end

  def find_story
    @story = Story.find(params[:id])
  end

end
