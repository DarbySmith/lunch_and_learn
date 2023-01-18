class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, only: [:create, :index]
  
  def create
    if @user
      if @user.favorites.create!(favorite_params).save 
        render json: { "success": "Favorite added successfully" }, status: 201
      end
    else
      render json: { "error": "Unable to save favorite" }, status: 400
    end
  end

  def index
    if @user 
      render json: FavoriteSerializer.new(@user.favorites)
    else
      render json: { "error": "User not found" }, status: 400
    end
  end

  private
  
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
  
  def find_user
    @user = User.find_by(api_key: params[:api_key])
  end
end