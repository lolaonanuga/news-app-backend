class Api::V1::CountriesController < ApplicationController


    class Api::V1::StoriesController < ApplicationController

    #     before_action :find_story, only: [:update]
    
    #   def index
    #     # @current_stories = Story.where(active: true)
    #     # @archived_stories = Story.where(active: false)
    #     @stories = Story.all
    #     render json: @stories
    #   end

      def show
        @country = Country.find(params[:id])
        render json: @country
      end
    
    #   def create
    #     @story = Story.new(story_params)
    #     if @story.save
    #         render json: @stories
    #     else
    #         render json: {error: 'Unable to add story.'}, status: 400
    #     end
    #   end
    
    
      private
    
      def country_params
        params.require(:story).permit([:name, :key, :stories])
      end
    
      def find_country
        @country = Country.find(params[:id])
      end
    
    

end