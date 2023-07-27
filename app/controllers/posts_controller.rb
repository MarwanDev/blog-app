class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.includes(:author).where(author_id: params[:user_id])
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.includes(:author).find_by(author_id: params[:user_id], id: params[:id])
    @user = @post.author
    @comments = Post.find(@post.id).comments
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.author_id = @user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.' }
        format.json { render :index, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @user = current_user
    @post = @user.posts.find_by(id: params[:id])

    puts @post.inspect
    respond_to do |format|
      @post.destroy
      format.html { redirect_to user_posts_path(@user), alert: 'Post Succesfully Destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:author_id, :title, :text, :created_at, :updated_at, :comments_counter,
                                 :likes_counter)
  end
end
