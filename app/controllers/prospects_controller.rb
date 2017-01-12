class ProspectsController < ApplicationController
  def index
    prospects = Prospect.all
    render json: prospects, methods: :next_package
  end
end
