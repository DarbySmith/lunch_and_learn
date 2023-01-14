class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      render json: RecipesSerializer.new(RecipesFacade.country_recipes(params[:country]))
    else
      country = CountriesFacade.random_country
      render json: RecipesSerializer.new(RecipesFacade.country_recipes(country.name))
    end
  end
end