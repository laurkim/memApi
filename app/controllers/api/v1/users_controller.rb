class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new(user_params)
  end

  def create
    User.create(user_params)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.highscore = user_params[:highscore]
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:name, :highscore)
  end
end
