class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipesSerializer.new(RecipesFacade.country_recipes(params[:country]))
  end
end