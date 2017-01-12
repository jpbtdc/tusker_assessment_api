class CitiesController < ApplicationController
  def index
    prospects = Prospect.all
    names = prospects.map(&:delivery_city).uniq
    cities = []
    names.each do |name|
      cities << { name: name, packages: prospects.select{ |prospect| prospect.delivery_city == name }.map(&:next_package) }
    end
    render json: cities
  end
end
