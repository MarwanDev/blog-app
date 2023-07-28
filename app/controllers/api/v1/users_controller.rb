class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @users = User.all
    respond_to do |format|
      if @users
        format.json { render json: @users, status: 200 }
      else
        format.json { render json: @users.errors, status: 400 }
      end
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_posts = @user.most_recent_three_posts
    respond_to do |format|
      if @user
        format.json { render json: @user, status: 200 }
      else
        format.json { render json: @user.errors, status: 400 }
      end
    end
  end
end
