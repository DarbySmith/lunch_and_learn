class Api::V1::FavoritesController < ApplicationController
  def create
    if User.find_by(api_key: params[:api_key])
      user = User.find_by(api_key: params[:api_key])
      if Favorite.new(country: params[:favorite][:country], recipe_link: params[:favorite][:recipe_link], recipe_title: params[:favorite][:recipe_title], user_id: user.id).save 
        render json: { "success": "Favorite added successfully" }, status: 201
      end
    else
      render json: { "error": "Unable to save favorite" }, status: 400
    end
  end
end