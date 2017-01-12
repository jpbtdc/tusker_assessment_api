class CitiesController < ApplicationController
  def index
    cities = City.all
    render json: cities
  end

  def show
    city = City.find_by_name(params[:id])
    if city.blank?
      render json: {error: 'not-found'}.to_json, status: :not_found
    else
      render json: city
    end
  end
end
