class Api::V1::CountriesController < ApplicationController
    
      def index
        @countries = Country.all
        render json: @countries
      end

      def show
        @country = Country.find(params[:id])
        render json: @country
      end
    
      private
    
      def country_params
        params.require(:story).permit([:name, :key, :stories])
      end
    
      def find_country
        @country = Country.find(params[:id])
      end
    
end