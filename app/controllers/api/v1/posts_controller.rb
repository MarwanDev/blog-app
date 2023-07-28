class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    respond_to do |format|
      if @posts
        format.json { render json: @posts, status: 200 }
      else
        format.json { render json: @posts.errors, status: 400 }
      end
    end
  end

  def show
    @post = Post.includes(:author).find_by(author_id: params[:user_id], id: params[:id])
    @user = @post.author
    @comments = Post.find(@post.id).comments
    respond_to do |format|
      if @post
        format.json { render json: @post, status: 200 }
      else
        format.json { render json: @post.errors, status: 400 }
      end
    end
  end
end
