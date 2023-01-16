class Api::V1::UsersController < ApplicationController

  def create
    if User.new(user_params).save
      User.last.destroy
      render json: UserSerializer.new(User.create!(user_params)), status: 201
    elsif User.find_by(email: params[:user][:email])
      render json: { errors: "User email must be unique" }, status: 400
    else
      render json: { errors: "User not created" }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end