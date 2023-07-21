class LikesController < ApplicationController
  before_action :set_like, only: %i[show edit update destroy]

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show; end

  # GET /likes/new


  # GET /likes/1/edit
  def edit; end

  # POST /likes or /likes.json
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @like = Like.new(author_id: @user.id, post_id: @post.id)
    return unless @like.save

    redirect_to user_post_path(@user.id, @post)
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to like_url(@like), notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like.destroy

    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
