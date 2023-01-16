class Api::V1::UsersController < ApplicationController

  def create
    if User.new(user_params).save
      User.last.destroy
      render json: UserSerializer.new(User.create!(user_params)), status: 201
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end