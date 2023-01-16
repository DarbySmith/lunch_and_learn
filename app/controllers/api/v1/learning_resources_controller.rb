class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourcesSerializer.new(LearningResourceFacade.country_resource(params[:country]))
  end
end