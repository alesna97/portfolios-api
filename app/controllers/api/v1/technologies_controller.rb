class Api::V1::TechnologiesController < ApplicationController

  def index
    technlogies = Technology.all 

    render json: technlogies
  end
end
