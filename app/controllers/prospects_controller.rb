class ProspectsController < ApplicationController
  def index
    prospects = Prospect.all
    render json: prospects, methods: :next_package
  end

  def show
    prospect = Prospect.find_by_contact(params[:id])
    if prospect.blank?
      render json: {error: 'not-found'}.to_json, status: :not_found
    else
      render json: prospect, methods: [ :next_package, :available_packages ]
    end
  end
end
